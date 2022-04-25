//
//  UIview+fillSuperviewSafeArea.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

extension UIView {

    func fillSuperviewSafeArea(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor, constant: padding.top)
            .isActive = true
        bottomAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.bottomAnchor, constant: -padding.bottom)
            .isActive = true
        leadingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.leadingAnchor, constant: padding.left)
            .isActive = true
        trailingAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.trailingAnchor, constant: -padding.right)
            .isActive = true
    }
}
