//
//  Network.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation
import Alamofire
import Combine

typealias NetworkCompletion<T> = (AFResult<T>) -> Void
typealias AFResult<T> = Future<T,Error>

protocol NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible,
                    decodeTo type: T.Type,
                    completionHandler: @escaping NetworkCompletion<T>) where T: Codable
    func cancelAllRequests()
}

class Network: RequestInterceptor {

#if DEBUG
    fileprivate let willPrint = true
#else
    fileprivate let willPrint = false
#endif

    fileprivate let networkMiddleware = NetworkMiddleware()

    fileprivate lazy var manager: Session = networkMiddleware.sessionManager

    fileprivate func process<T>(response: AFDataResponse<Any>, decodedTo type: T.Type) -> AFResult<T> where T: Codable {
        return AFResult<T> { promise in
            
            switch response.result {
            case .success:
                guard let data = response.data else {
                    return promise(.failure(NSError.create(description: "Server Error")))
                }

                do {
                    let data =  try JSONDecoder().decode(type, from: data)
                    promise(.success(data))
                } catch {
                    
                    return promise(.failure(NSError.create(description: "Server Error")))
                }
                
            case .failure(let error):
                
                promise(.failure(error))
            }
        }
    }

    func cancelAllRequests() {
        manager.session.getAllTasks { tasks in tasks.forEach { $0.cancel() } }
    }
}

extension Network: NetworkProtocol {
    func request<T>(_ request: URLRequestConvertible,
                    decodeTo type: T.Type,
                    completionHandler: @escaping (AFResult<T>) -> Void) where T: Codable {
        manager.request(request).responseJSON {[weak self] response in
            guard let self = self else { return }

            if self.willPrint {
                debugPrint("=======DEBUG=NETWORK=============Request URL")
                debugPrint(response.request?.url?.absoluteString as Any)
                debugPrint("=======DEBUG=NETWORK=============Request RESPONSE")
                debugPrint(response)
            }

            completionHandler(self.process(response: response, decodedTo: type))
        }
    }
}

fileprivate extension NSError {
    class func create(description: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
