//
//  codecoveragetoolsTests.swift
//  codecoveragetoolsTests
//
//  Created by jk on 2022-05-17.
//

import XCTest
@testable import codecoveragetools

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

class codecoveragetoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let e = expectation(description: "e")
        let mock = NetworkServiceMock(e: e)
        let sut = ContentViewModel(network: mock)
        sut.buttonTapped()
        waitForExpectations(timeout: 1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
