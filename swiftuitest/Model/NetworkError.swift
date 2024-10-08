//
//  NetworkError.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case serverError(Int)
    
    var message: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data"
        case .decodingError:
            return "Data parsing error"
        case .serverError(let code):
            return "Server error: \(code)"
        }
    }
}
