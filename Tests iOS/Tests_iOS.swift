//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by jk on 2022-05-17.
//

import XCTest

class NetworkServiceMock: NetworkService {
    let e: XCTestExpectation
    init(e: XCTestExpectation) {
        self.e = e
    }
    func callNetwork(completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
        e.fulfill()
    }
}

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let e = expectation(description: "e")
        let mock = NetworkServiceMock(e: e)
        let sut = ContentViewModel(network: mock)
        sut.buttonTapped()
        waitForExpectations(timeout: 1)

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
