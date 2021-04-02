//
//  CoreDataManager.swift
//  Cat Test
//
//  Created by YERMIS.BELTRAN on 1/04/21.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var container: NSPersistentContainer! { get }
}
class CoreDataManager: CoreDataManagerProtocol {
    
    let container: NSPersistentContainer!
    static let shared = CoreDataManager()
    
    init() {
        container = NSPersistentContainer(name: "CatsModel")
        setupDatabase()
    }
    
    private func setupDatabase() {
        container.loadPersistentStores { (desc, error) in
            return
        }
    }
}
