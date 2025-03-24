//
//  CombineExpectationTests.swift
//  SwiftUICombineUnitTestingTests
//
//  Created by 김동현 on 3/25/25.
//

import XCTest
import Combine
@testable import SwiftUICombineUnitTesting

final class CombineExpectationTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testAsyncPublisherResponse() {
        let publisher = Just("Test")
            .delay(for: 0.5, scheduler: RunLoop.main)
            .eraseToAnyPublisher()

        let expectation = XCTestExpectation(description: "Async Combine Test")

        publisher
            .sink(receiveValue: { value in
                XCTAssertEqual(value, "Test")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}
