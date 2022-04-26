//
//  Image.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation

// MARK: - Image
struct Image: Codable {
    let title: String?
    let url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case url, title
        case thumbnailURL = "thumbnailUrl"
    }
}
