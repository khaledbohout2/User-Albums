//
//  BaseView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupAppearance()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    func setupAppearance() {
        backgroundColor = .appBackground
    }

    func setupView() {}
}
