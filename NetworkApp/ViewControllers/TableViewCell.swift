//
//  TableViewCell.swift
//  NetworkApp
//
//  Created by Evgenia Shipova on 23.09.2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var superHeroLabel: UILabel!
    @IBOutlet weak var firstAppearance: UILabel!
    @IBOutlet weak var alterEgoLabel: UILabel!
    
    func configure(with hero: Hero) {
        superHeroLabel.text = hero.superhero ?? ""
        firstAppearance.text = "First Appearance: \(hero.firstAppearance ?? "")"
        alterEgoLabel.text = "Alter Ego: \(hero.alterEgo ?? "")"
    }
}

