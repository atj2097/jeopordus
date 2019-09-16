//
//  jeapordusTests.swift
//  jeapordusTests
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import XCTest
@testable import jeapordus

class jeapordusTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


        func testShowDoesExist() {
            let url = "https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple"
            NetWorkManager.shared.fetchData(urlString: url) {(result) in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let data):
                    XCTAssert(data.isEmpty == false)
                }
            }
        }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
