//
//  URLRequestConvertible.swift
//  Abilities
//
//  Created by Aya on 11/10/2021.
//

import Alamofire

protocol URLRequestConvertible: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
}
