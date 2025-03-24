//
//  ProfileIntegrationTests.swift
//  SwiftUITestingEssentialsTests
//
//  Created by 김동현 on 3/24/25.
//

import XCTest
import Combine
@testable import SwiftUITestingEssentials

final class ProfileIntegrationTests: XCTestCase {
    private var cancellables = Set<AnyCancellable>()

    func testIntegrationFetchUser() {
        let mockService = MockUserService(response: .success(User(id: "123", name: "Lisa")))
        let viewModel = ProfileViewModel(userService: mockService)

        let expectation = XCTestExpectation(description: "Integration fetch user")

        viewModel.$userName
            .dropFirst()
            .sink { userName in
                XCTAssertEqual(userName, "Lisa")
                expectation.fulfill()
            }
            .store(in: &cancellables)

        viewModel.fetchUser(id: "123")

        wait(for: [expectation], timeout: 2.0)
    }
}
