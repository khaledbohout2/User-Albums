//
//  AppDelegate+Appearence.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 22/04/2022.
//

import UIKit

extension AppDelegate {
    func setAppearance() {
        setNavigationAppearance()
        setImageViewAppearance()
    }

    func setNavigationAppearance() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.appMainText]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.appMainText]
            navBarAppearance.shadowColor = .clear
            navBarAppearance.backgroundColor = .appBackground
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().compactAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        } else {
            UINavigationBar.appearance().tintColor = .appMainText
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().backgroundColor = UIColor.appBackground
        }
        UINavigationBar.appearance().isTranslucent = false
    }

    func setImageViewAppearance() {
        UIImageView.appearance().contentMode = .scaleAspectFill
        UIImageView.appearance().clipsToBounds = true
    }
}

