//
//  AlbumRepository.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation

protocol AlbumRepositoryDelegate: AnyObject {
    func getAlbums(userId: Int, completionHandler: @escaping(AFResult<[Album]>) -> Void)
    func getPhotos(albumId: Int, completionHandler: @escaping(AFResult<[Image]>) -> Void)
}

class AlbumRepository: AlbumRepositoryDelegate {

    private var network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }

    func getAlbums(userId: Int, completionHandler: @escaping(AFResult<[Album]>) -> Void) {
        let route = AlbumNetworkRouter.getAlbums(userId: userId)
        network.request(route, decodeTo: [Album].self, completionHandler: completionHandler)
    }
    
    func getPhotos(albumId: Int, completionHandler: @escaping(AFResult<[Image]>) -> Void) {
        let route = AlbumNetworkRouter.getPhotos(albumId: albumId)
        network.request(route, decodeTo: [Image].self, completionHandler: completionHandler)
    }

}


