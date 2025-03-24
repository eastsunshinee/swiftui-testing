//
//  MockUserService.swift
//  SwiftUITestingEssentials
//
//  Created by 김동현 on 3/24/25.
//

import Foundation
import Combine

class MockUserService: UserServiceProtocol {
    var response: Result<User, Error>

    init(response: Result<User, Error>) {
        self.response = response
    }

    func fetchUser(id: String) -> AnyPublisher<User, Error> {
        Future { promise in
            promise(self.response)
        }
        .eraseToAnyPublisher()
    }
}
