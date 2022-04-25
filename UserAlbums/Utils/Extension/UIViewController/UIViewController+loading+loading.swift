//
//  UIViewController+loading+loading.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

extension UIViewController: NVActivityIndicatorViewable {

    func startLoading(message: String? = nil) {
        NVActivityIndicatorView.DEFAULT_COLOR = .blue
        NVActivityIndicatorView.DEFAULT_BLOCKER_BACKGROUND_COLOR = .black.withAlphaComponent(0.2)
        NVActivityIndicatorView.DEFAULT_TEXT_COLOR = .appMainText
        NVActivityIndicatorView.DEFAULT_BLOCKER_MESSAGE_FONT = .poppins(size: 14)
        startAnimating(message: message, type: NVActivityIndicatorType.ballScaleMultiple)
    }

    func setLoadingMessage(message: String) {
        NVActivityIndicatorPresenter.sharedInstance.setMessage(message)
    }

    func stopLoading() {
        stopAnimating()
    }

}

