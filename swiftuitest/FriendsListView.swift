//
//  FriendsListView.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation
import SwiftUI

struct FriendsListView: View {
    @State private var viewModel = FriendsListViewModel()  // استخدام @State لإدارة الـ ViewModel
    @State private var friends: [Friend] = []
    @State private var isLoading = false
    @State private var error: NetworkError?
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    ProgressView("Loading...")
                } else if let error = error {
                    VStack(spacing: 16) {
                        Text("😕")
                            .font(.system(size: 64))
                        Text(error.localizedDescription)
                            .multilineTextAlignment(.center)
                        Button("Try Again") {
                            Task {
                                await loadFriends()
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                } else {
                    List(friends) { friend in
                        NavigationLink {
                            FriendsDetailsView(friend: friend)
                        } label: {
                            FriendRowView(friend: friend)
                        }
                    }
                    .refreshable {
                        await loadFriends()
                    }
                }
            }
            .navigationTitle("Friends")
            .task {
                if friends.isEmpty {
                    await loadFriends()
                }
            }
        }
    }
    
    private func loadFriends() async {
        isLoading = true
        error = nil
        do {
            friends = try await viewModel.friendsService.fetchFriends()
        } catch let networkError as NetworkError {
            error = networkError
        } catch {
            error = .networkError(error)
        }
        isLoading = false
    }
}
