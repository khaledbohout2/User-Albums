//
//  UITableViewCell+identifier.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
