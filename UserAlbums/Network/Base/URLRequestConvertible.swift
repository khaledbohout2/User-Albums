//
//  URLRequestConvertible.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
