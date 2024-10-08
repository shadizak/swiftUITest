//
//  NetworkManager.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation

import Foundation

class NetworkManager: NetworkManagerProtocol {
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    
 
    private func fetchData<T: Decodable>(from endpoint: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.serverError(0)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
    
     
    func fetchFriends() async throws -> FrendsModel {
        return try await fetchData(from: "users", as: FrendsModel.self)
    }
        
}
