//
//  FriendsListViewModel.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation


class FriendsListViewModel {
    
    var friends: [Friend] = []
    var isLoading = false
    var error: NetworkError?
    
    private let friendsService: FriendsServiceProtocol
    
    init(friendsService: FriendsServiceProtocol = FriendsService()) {
        self.friendsService = friendsService
    }
    
    func loadFriends() async {
        isLoading = true
        error = nil
        
        do {
            friends = try await friendsService.fetchFriends()
        } catch let networkError as NetworkError {
            error = networkError
        } catch {
            error = .networkError(error)
        }
        
        isLoading = false
    }
}
