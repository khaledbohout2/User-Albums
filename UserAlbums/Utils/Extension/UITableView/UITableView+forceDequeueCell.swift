//
//  UITableView+forceDequeueCell.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit

extension UITableView {
    func forceDequeueCell<T: UITableViewCell>(identifier: String) -> T {
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
