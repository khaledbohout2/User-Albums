//
//  AlbumDetailsVCRouter.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import UIKit

class AlbumDetailsVCRouter {

    class func create(albumId: Int, title: String) -> UIViewController {
        let repository = AlbumRepository(network: Network())
        let viewModel = AlbumDetailsViewModel(repository: repository, albumId: albumId)
        let router = AlbumDetailsVCRouter()
        let albumDetailsVC = AlbumDetailsVC(viewModel: viewModel, router: router, title: title)
        return albumDetailsVC
    }

    func navigateToImagePreview(from view: AlbumDetailsVC, image: String) {
        let destination = ImagePreviewVCRouter.create(image: image)
        view.navigationController?.pushViewController(destination, animated: true)
    }
}
