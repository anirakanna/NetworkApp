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
    
    func configure(with course: Hero) {
        superHeroLabel.text = course.superhero ?? ""
        firstAppearance.text = "First Appearance: \(course.first_appearance ?? "")"
        alterEgoLabel.text = "Alter Ego: \(course.alter_ego ?? "")"
    }
}
