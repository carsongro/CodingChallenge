//
//  DesserViewModelTests.swift
//  FetchCodingChallengeTests
//
//  Created by Carson Gross on 3/12/24.
//

import Observation
import XCTest
@testable import FetchCodingChallenge

final class DesserViewModelTests: XCTestCase {
    
    var dessertVM: DessertViewModel!

    override func setUp() {
        super.setUp()
        self.dessertVM = DessertViewModel(mealService: MockMealService())
    }

    override func tearDown() {
        super.tearDown()
        self.dessertVM = nil
    }
    
    func testFetchDessertSuccessfully() async {
        
        let expectation = XCTestExpectation(description: "Fetched Desserts")
        
        await dessertVM.getDessertList()
        
        withObservationTracking {
            _ = dessertVM.desserts
        } onChange: {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 1.0)
        
        XCTAssertEqual(self.dessertVM.desserts.count, 3)
    }
}
