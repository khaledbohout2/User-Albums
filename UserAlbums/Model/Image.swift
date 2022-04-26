//
//  Image.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation

// MARK: - Image
struct Image: Codable {
    private let title: String?
    private let thumbnailURL: String?
    private let url: String?

    enum CodingKeys: String, CodingKey {
        case url, title
        case thumbnailURL = "thumbnailUrl"
    }
    
    func getURL() -> String? {
        return url
    }
    
    func getThumbnailURL() -> String? {
        return thumbnailURL
    }
    
    func getTitle() -> String? {
        return title
    }
}
