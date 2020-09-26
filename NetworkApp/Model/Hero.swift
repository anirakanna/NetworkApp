//
//  Hero.swift
//  NetworkApp
//
//  Created by Evgenia Shipova on 22.09.2020.
//

struct Hero: Decodable {
    let superhero: String?
    let alterEgo: String?
    let firstAppearance: String?
    
    init(heroData: [String: Any]) {
        superhero = heroData["superhero"] as? String
        alterEgo = heroData["alter_ego"] as? String
        firstAppearance = heroData["first_appearance"] as? String
    }
    static func getHeroes(from value: Any) -> [Hero]? {
        guard let coursesData = value as? [[String: Any]] else { return [] }
        return coursesData.compactMap { Hero(heroData: $0) }
    }
}

