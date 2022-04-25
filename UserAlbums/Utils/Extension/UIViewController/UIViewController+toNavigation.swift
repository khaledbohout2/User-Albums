//
//  UIViewController+toNavigation.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import UIKit

extension UIViewController {
    func toNavigation() -> UINavigationController {
        let nav =  UINavigationController(rootViewController: self)
        return nav
    }
}
