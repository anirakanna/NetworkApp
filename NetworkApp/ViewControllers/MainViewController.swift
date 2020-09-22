//
//  MainViewController.swift
//  NetworkApp
//
//  Created by Evgenia Shipova on 22.09.2020.
//

import UIKit

enum URLExamples: String {
    case urlJson = "https://gist.githubusercontent.com/mariodev12/a923f2b651a005ca3ca7f851141efcbc/raw/39b06a32e4a58fc1fe63c7478a97edccd21138f1/superheroes.json"
    case urlImage = "https://stoneforest.ru/wp-content/uploads/2017/05/dc-comics-gajd.jpg"
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        network.fetchImage(imageView: imageView)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? HeroesListTableViewController else { return }
        descriptionVC.network.fetchHeroesList()
    }
    
}
