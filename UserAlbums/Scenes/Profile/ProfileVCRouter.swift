//
//  ProfileVCRouter.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class ProfileVCRouter {

    class func create() -> UIViewController {
        let profileRepository = ProfileRepository(network: Network())
        let albumRepository = AlbumRepository(network: Network())
        let viewModel = ProfileViewModel(profileRepository: profileRepository,
                                         albumRepository: albumRepository)
        let router = ProfileVCRouter()
        return ProfileVC(viewModel: viewModel, router: router)
    }
    
    func navigateToAlbum(from view: ProfileVC, albumID: Int, title: String) {
        let destinationVC = AlbumDetailsVCRouter.create(albumId: albumID, title: title)
        view.navigationController?.pushViewController(destinationVC, animated: true)
    }
}
