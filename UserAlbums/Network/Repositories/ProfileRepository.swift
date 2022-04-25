//
//  ProfileRepository.swift
//  Abilities
//
//  Created by Khaled Bohout on 21/11/2021.
//

import Foundation

protocol ProfileRepositoryDelegate: AnyObject {
    func getProfile(completionHandler: @escaping(AFResult<[User]>) -> Void)
}

class ProfileRepository: ProfileRepositoryDelegate {

    private var network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }

    func getProfile(completionHandler: @escaping(AFResult<[User]>) -> Void) {
        let route = ProfileNetworkRouter.getProfiles
        network.request(route, decodeTo: [User].self, completionHandler: completionHandler)
    }

}
