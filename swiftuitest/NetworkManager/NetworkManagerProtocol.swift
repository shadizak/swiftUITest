//
//  NetworkManagerProtocol.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchFriends() async throws -> FrendsModel
}
