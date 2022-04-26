//
//  ProfileRepository.swift
//  Abilities
//
//  Created by Khaled Bohout on 21/11/2021.
//

import Foundation

protocol ProfileRepositoryDelegate: AnyObject {
    func getProfile() -> AFResult<[User]>
}

class ProfileRepository: ProfileRepositoryDelegate {

    private var network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }

    func getProfile() -> AFResult<[User]> {
        let route = ProfileNetworkRouter.getProfiles
        return network.request(route)
        
    }

}
