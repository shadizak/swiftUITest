//
//  FrendsModel.swift
//  swiftuitest
//
//  Created by shadi zaqout on 07/10/2024.
//

import Foundation

struct FrendsModelElement: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
    
    var isFavorite: Bool? = false   
}

struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

struct Geo: Codable {
    let lat, lng: String?
}

struct Company: Codable {
    let name, catchPhrase, bs: String?
}

typealias FrendsModel = [FrendsModelElement]

