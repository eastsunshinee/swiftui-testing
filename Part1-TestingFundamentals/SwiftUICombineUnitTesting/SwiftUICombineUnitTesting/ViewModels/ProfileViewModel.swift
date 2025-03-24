//
//  ProfileViewModel.swift
//  SwiftUICombineUnitTesting
//
//  Created by 김동현 on 3/25/25.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    @Published var userName: String = ""

    private let userService: UserServiceProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func fetchUser(id: String) {
        userService.fetchUser(id: id)
            .map(\.name)
            .replaceError(with: "Unknown")
            .receive(on: DispatchQueue.main)
            .assign(to: &$userName)
    }
}
