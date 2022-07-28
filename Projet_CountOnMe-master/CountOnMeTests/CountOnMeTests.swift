//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Moltes Touvabien on 12/07/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import XCTest

@testable import CountOnMe

class CountOnMeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGivenElementsDone_WhenCalculDone_ThenResultGiven(){
        
        let countOnMe = CountOnMe()
        
        let calculTest = countOnMe.calculate(temporaryArrayElements: ["1", "x", "3"])
        let calculTest2 = countOnMe.calculate(temporaryArrayElements: ["1", "x", "x"])
        let calculTest3 = countOnMe.calculate(temporaryArrayElements: ["1", "x"])
        
        //XCTAssert(Int(calculTest) == (1 * 3))
        XCTAssertEqual(Int(calculTest[0]), 3)
        XCTAssertEqual(Int(calculTest2[0]), 3)
        XCTAssertEqual(Int(calculTest3[0]), 3)
    }

}
