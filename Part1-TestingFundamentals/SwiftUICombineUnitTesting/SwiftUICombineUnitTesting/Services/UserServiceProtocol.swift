//
//  UserServiceProtocol.swift
//  SwiftUICombineUnitTesting
//
//  Created by 김동현 on 3/24/25.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    func fetchUser(id: String) -> AnyPublisher<User, Error>
}
