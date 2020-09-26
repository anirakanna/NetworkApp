//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Evgenia Shipova on 23.09.2020.
//

import UIKit
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchHeroesList(from urlString: String, with complition: @escaping ([Hero]) -> Void) {
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let hero = Hero.getHeroes(from: value) ?? []
                    DispatchQueue.main.async {
                        complition(hero)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImage(with complition: @escaping (UIImage) -> Void) {

        guard let imageURL = URL(string: URLExamples.urlImage.rawValue) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    complition(image)
                }
            }
        }.resume()
    }
}

