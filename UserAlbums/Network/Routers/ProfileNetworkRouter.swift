//
//  ProfileNetworkRouter.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import Foundation
import Alamofire

enum ProfileNetworkRouter: URLRequestConvertible {

    case getProfiles

    var method: HTTPMethod {
        switch self {
        case .getProfiles:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getProfiles:
            return nil
        }
    }

    var url: URL {
        return URL(string: "\(Constants.baseUrl)")!
            .appendingPathComponent(path)
    }

    var path: String {
        switch self {
        case .getProfiles:
            return "users"
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
