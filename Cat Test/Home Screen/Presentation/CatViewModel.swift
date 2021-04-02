//
//  CatCellViewModel.swift
//  Cat Test
//
//  Created by Yermis Giovanny Beltrán Cuervo on 13/03/21.
//

import Foundation
import UIKit

typealias LikeDislike = (like: Bool, dislike: Bool)

class CatViewModel {
    private let model: CatModel
    let image: UIImage

    let persistence = RatingPersistence()
    var didLoadRating: ((LikeDislike) -> Void)?
    
    init(model: CatModel, image: UIImage) {
        self.model = model
        self.image = image
    }
    
    var id: String {
        return model.id
    }
    
    var race: String {
        return model.name
    }
    
    var origin: String {
        return model.origin
    }
    
    var intelligence: String {
        return "Inteligencia: \(model.intelligence)"
    }
    
    var catDescription: String {
        return model.description
    }
    
    var url: String? {
        return model.image?.url
    }
    
    var urlWiki: String? {
        return model.wikipediaUrl
    }
    
    func ratingLike() {
        persistence.createLikeRating(raceId: id)
    }
    
    func ratingDislike() {
        persistence.createLikeRating(raceId: id, dislike: true, like: false)
    }
    
    func getLikeDisLike() {
        guard let result = persistence.getRating(id: id) else {
            return
        }
        
        didLoadRating?((result.like, result.dislike))
    }
}
