//
//  UIImage.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(with url: String, placeHolder: UIImage? = #imageLiteral(resourceName: "profile")) {
        guard let url = URL(string: url) else { return }
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_setImage(with: url,
                         placeholderImage: placeHolder,
                         options: .continueInBackground,
                         completed: nil)
    }
}
