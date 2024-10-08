//
//  FriendsViewModel.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation
import SwiftUI

@MainActor
final class FriendsViewModel: ObservableObject {
    @Published var friends: [FrendsModelElement] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let networkManager: NetworkManager
    let coreDataManager: CoreDataManager
    
    init(networkManager: NetworkManager = NetworkManager(),
         coreDataManager: CoreDataManager = .shared) {
        self.networkManager = networkManager
        self.coreDataManager = coreDataManager
    }
    
    func loadFriends() async {
        isLoading = true
        errorMessage = nil
        
        do {
            friends = try await networkManager.fetchFriends()
            updateFavoritesStatus()
        } catch let error as NetworkError {
            errorMessage = error.message
        } catch {
            errorMessage = "Unknown Error"
        }
        
        isLoading = false
    }
    
    private func updateFavoritesStatus() {
        for index in friends.indices {
            if let friendId = friends[index].id {
                friends[index].isFavorite = coreDataManager.isFavorite(friendId: friendId)
            }
        }
    }
    
    func updateFriendFavoriteStatus(friendId: Int, isFavorite: Bool) {
        if let index = friends.firstIndex(where: { $0.id == friendId }) {
            friends[index].isFavorite = isFavorite
        }
    }
}
