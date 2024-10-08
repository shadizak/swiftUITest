//
//  FriendDetailsViewModel.swift
//  swiftuitest
//
//  Created by shadi zaqout on 08/10/2024.
//

import Foundation

@MainActor
final class FriendDetailsViewModel: ObservableObject {
    @Published var friend: FrendsModelElement
    private let coreDataManager: CoreDataManager
    private let friendsViewModel: FriendsViewModel
    
    init(friend: FrendsModelElement,
         coreDataManager: CoreDataManager = .shared,
         friendsViewModel: FriendsViewModel) {
        self.friend = friend
        self.coreDataManager = coreDataManager
        self.friendsViewModel = friendsViewModel
        
        if let friendId = friend.id {
            self.friend.isFavorite = coreDataManager.isFavorite(friendId: friendId)
        } else {
            self.friend.isFavorite = false
        }
    }
    
    func toggleFavorite() {
        guard let friendId = friend.id else { return }
        
        let isFavorite = !(friend.isFavorite ?? false)
        friend.isFavorite = isFavorite
        
        if isFavorite {
            coreDataManager.saveFriendIdToCoreData(friendId: friendId)
        } else {
            coreDataManager.deleteFriendIdFromCoreData(friendId: friendId)
        }
        
      
        friendsViewModel.updateFriendFavoriteStatus(friendId: friendId, isFavorite: isFavorite)
    }
}
