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
        return ProfileVC(viewModel: viewModel)
    }
    
    func navigateToAlbum(albumID: String) {
        
    }
}
