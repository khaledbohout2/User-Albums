//
//  UICollectionView+forceDequeueCell.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit

extension UICollectionView {
    func forceDequeueCell<T: UICollectionViewCell>(identifier: String, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
