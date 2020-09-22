//
//  NetworkManager.swift
//  NetworkApp
//
//  Created by Evgenia Shipova on 23.09.2020.
//

import UIKit

class NetworkManager {
    var heroes: [Hero] = []
    
    func fetchHeroesList() {
        guard let url = URL(string: URLExamples.urlJson.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            let jsonDecoder = JSONDecoder()
            
            do {
                self.heroes = try jsonDecoder.decode([Hero].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }

     func fetchImage(imageView: UIImageView) {
       
        guard let imageURL = URL(string: URLExamples.urlImage.rawValue) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    //self.activityIndicator.stopAnimating()
                    imageView.image = image
                }
            }
        }.resume()
    }
}
