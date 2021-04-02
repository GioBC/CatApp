//
//  RatingPersistence.swift
//  Cat Test
//
//  Created by YERMIS.BELTRAN on 1/04/21.
//

import Foundation
import CoreData

class RatingPersistence {
    
    var manager: CoreDataManagerProtocol
    
    init(manager: CoreDataManagerProtocol = CoreDataManager.shared ) {
        self.manager = manager
    }
    
    func createLikeRating(raceId: String, dislike: Bool = false, like: Bool = true) {
        let context = manager.container.viewContext
        
        if let _ = getRating(id: raceId) {
            updateLikeRating(raceId: raceId, dislike: dislike, like: like)
            return
        }
        let rating = Rating(context: context)
        rating.raceId = raceId
        rating.like = like
        rating.dislike = dislike
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func updateLikeRating(raceId: String, dislike: Bool = false, like: Bool = true) {
        let context = manager.container.viewContext
        
        if let rating = getRating(id: raceId) {
            rating.raceId = raceId
            rating.like = like
            rating.dislike = dislike
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
        
    }
    
    func getRating(id: String) -> Rating? {
        let fetchRequest: NSFetchRequest<Rating> = Rating.fetchRequest()
        let predicate = NSPredicate(format: "raceId = %@", id)
        fetchRequest.predicate = predicate
        let context = manager.container.viewContext
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.first
        } catch {
            print("Error")
        }
        return nil
    }
}
