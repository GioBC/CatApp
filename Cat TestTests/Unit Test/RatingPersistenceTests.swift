//
//  RatingPersistenceTests.swift
//  Cat TestTests
//
//  Created by YERMIS.BELTRAN on 1/04/21.
//

import XCTest
@testable import Cat_Test

class RatingPersistenceTests: XCTestCase {
    
    var SUT: RatingPersistence?

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_save_like() {
        SUT = RatingPersistence(manager: FakeCoreDataManager.shared)
        
        SUT?.createLikeRating(raceId: "prueba")
        
        let result = SUT?.getRating(id: "prueba")
        
        XCTAssertEqual(result?.like, true)
        XCTAssertEqual(result?.dislike, false)
    }
    
    
    func test_save_dislike() {
        SUT = RatingPersistence(manager: FakeCoreDataManager.shared)
        
        SUT?.createLikeRating(raceId: "prueba", dislike: true, like: false)
        
        let result = SUT?.getRating(id: "prueba")
        
        XCTAssertEqual(result?.like, false)
        XCTAssertEqual(result?.dislike, true)
    }

}
