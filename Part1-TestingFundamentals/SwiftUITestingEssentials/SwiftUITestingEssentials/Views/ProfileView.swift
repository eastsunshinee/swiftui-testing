//
//  ProfileView.swift
//  SwiftUITestingEssentials
//
//  Created by 김동현 on 3/24/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Text("User Name:")
            Text(viewModel.userName)
                .font(.title)
                .bold()
        }
        .onAppear {
            viewModel.fetchUser(id: "123")
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(userService: MockUserService(response: .success(User(id: "123", name: "Lisa")))))
}
