//
//  ProfileViewModelTests.swift
//  SwiftUICombineUnitTestingTests
//
//  Created by 김동현 on 3/25/25.
//

import XCTest
import Combine
@testable import SwiftUICombineUnitTesting

final class ProfileViewModelTests: XCTestCase {

    private var cancellables = Set<AnyCancellable>()

    func testFetchUser_Success() {
        let mockService = MockUserService(response: .success(User(id: "123", name: "Lisa")))
        let viewModel = ProfileViewModel(userService: mockService)

        let expectation = XCTestExpectation(description: "User name should be Lisa")

        viewModel.$userName
            .dropFirst()
            .sink { name in
                XCTAssertEqual(name, "Lisa")
                expectation.fulfill()
            }
            .store(in: &cancellables) // 테스트 전용 cancellables 사용

        viewModel.fetchUser(id: "123")

        wait(for: [expectation], timeout: 2.0)
    }
}
