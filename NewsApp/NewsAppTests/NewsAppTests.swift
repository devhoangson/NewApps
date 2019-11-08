//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import XCTest
@testable import NewsApp

class NewsAppTests: XCTestCase {

    override func setUp() {
        super.setUp()
        self.testPasswordFromUsername("Son1")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testPasswordFromUsername(_ userName: String) {
        if let password = LocalDatabase.getPasswordFromUserName(userName) {
            return password == "123456" ? print(assert(true, "success")) : print(assert(false, "false"))
        }
        print(assert(false, "No existed username"))
    }
}
