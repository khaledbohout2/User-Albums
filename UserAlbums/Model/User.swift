//
//  User.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int?
    let name: String?
    let address: Address?
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
}

extension Address {
    func formatAddress() -> String {
        let city = self.city ?? ""
        let street = self.street ?? ""
        let suite = self.suite ?? ""
        let zipcode = self.zipcode ?? ""
        let fullAddress =  city + ", " + street + ", " + suite + ", " + zipcode
        return fullAddress
    }
}
