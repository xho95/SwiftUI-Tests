//
//  Tests_Shared.swift
//  Tests Shared
//
//  Created by Kim, Min Ho on 2021/06/30.
//

import XCTest

@testable import MultiplatformTest

class Tests_Shared: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        
        XCTAssertEqual(playData.allWords.count, 0, "allWords must be 0")
    }
}
