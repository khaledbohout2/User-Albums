//
//  AlbumNetworkRouter.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation
import Alamofire

enum AlbumNetworkRouter: URLRequestConvertible {

    case getAlbums(userId: Int)
    case getPhotos(albumId: Int)

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getAlbums(let userID):
            return ["userId": userID]
        case .getPhotos(let albumId):
            return["albumId" : albumId]
            
        }
    }

    var url: URL {
        return URL(string: "\(Constants.baseUrl)")!
            .appendingPathComponent(path)
    }

    var path: String {
        switch self {
        case .getAlbums:
            return "albums"
        case .getPhotos:
            return "photos"
        }
    }

    var encoding: ParameterEncoding {
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }
}
