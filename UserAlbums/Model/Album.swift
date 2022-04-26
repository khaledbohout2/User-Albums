//
//  Album.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    private let id: Int?
    private let title: String?
    
    func getId() -> Int? {
        return id
    }
    
    func getTitle() -> String? {
        return title
    }
}
