//
//  FriendsAppView.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import SwiftUI

@MainActor
struct FriendsAppView: View {
    @StateObject private var viewModel = FriendsViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                switch (viewModel.isLoading, viewModel.errorMessage) {
                case (true, _):
                    ProgressView("loading ...")
                case (_, .some(let error)):
                    ErrorView(message: error) {
                        Task { await viewModel.loadFriends() }
                    }
                case (false, nil):
                    friendsList
                }
            }
            .navigationTitle("My Friends 👨‍💻")
        }
        .task {
            if viewModel.friends.isEmpty {
                await viewModel.loadFriends()
            }
        }
    }
    
    private var friendsList: some View {
            List(viewModel.friends, id: \.id) { friend in
                NavigationLink {
                    FriendDetailsView(viewModel: FriendDetailsViewModel(
                        friend: friend,
                        friendsViewModel: viewModel
                    ))
                } label: {
                    FriendRowView(friend: friend)
                }
            }
        }
}
