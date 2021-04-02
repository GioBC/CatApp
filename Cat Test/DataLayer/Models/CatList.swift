//
//  CatList.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 13/03/21.
//

import Foundation

struct CatModel: Codable {
    var id: String
    var name: String
    var temperament: String
    var origin: String
    var description: String
    var intelligence: Int
    var wikipediaUrl: String?
    var image: CatImageModel?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case origin
        case description
        case intelligence
        case wikipediaUrl = "wikipedia_url"
        case image
    }
    
}

struct CatImageModel: Codable {
    var id: String?
    var url: String?
}
