//
//  ImagePreviewVCRouter.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 26/04/2022.
//

import UIKit

class ImagePreviewVCRouter {
    class func create(image: String) -> UIViewController {
        return ImagePreviewVC(image: image)
    }
}
