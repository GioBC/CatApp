//
//  FakeCoreDataManager.swift
//  Cat TestTests
//
//  Created by YERMIS.BELTRAN on 1/04/21.
//

import Foundation
import CoreData
@testable import Cat_Test

class FakeCoreDataManager: CoreDataManagerProtocol {
    let container: NSPersistentContainer!
    static let shared: CoreDataManagerProtocol = FakeCoreDataManager()
    
    init() {
        container = NSPersistentContainer(name: "CatsModel")
        setupDatabase()
    }
    
    private func setupDatabase(){
        container.loadPersistentStores { (desc, error) in
            desc.type = NSInMemoryStoreType
            return
        }
    }
}
