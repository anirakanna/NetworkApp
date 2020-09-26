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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityIndicator = showSpinner(in: imageView)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        ImageManager.shared.fetchImage { image in
            self.imageView.image = image
            activityIndicator.stopAnimating()
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.color = .gray
            activityIndicator.startAnimating()
            activityIndicator.center = view.center
            activityIndicator.hidesWhenStopped = true
            
            view.addSubview(activityIndicator)
            
            return activityIndicator
        }
}
