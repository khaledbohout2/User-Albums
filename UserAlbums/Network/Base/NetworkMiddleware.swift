//
//  NetworkMiddleware.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation
import Alamofire

class NetworkMiddleware: RequestInterceptor {

    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {

        var urlRequest = urlRequest

        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        completion(.success(urlRequest))
    }

    lazy var sessionManager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 60
        configuration.timeoutIntervalForRequest = 60
        return Alamofire.Session(configuration: configuration, interceptor: self)
    }()

}
