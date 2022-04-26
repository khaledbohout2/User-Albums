//
//  AlbumRepository.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation

protocol AlbumRepositoryDelegate: AnyObject {
    func getAlbums(userId: Int) -> AFResult<[Album]>
    func getPhotos(albumId: Int) -> AFResult<[Image]>
}

class AlbumRepository: AlbumRepositoryDelegate {

    private var network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }

    func getAlbums(userId: Int) -> AFResult<[Album]> {
        let route = AlbumNetworkRouter.getAlbums(userId: userId)
        return network.request(route)
    }

    func getPhotos(albumId: Int) -> AFResult<[Image]> {
        let route = AlbumNetworkRouter.getPhotos(albumId: albumId)
        return network.request(route)
    }

}


