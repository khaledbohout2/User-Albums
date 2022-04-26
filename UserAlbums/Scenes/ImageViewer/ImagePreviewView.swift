//
//  ImageViewerView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import Foundation

class ImageViewerView: BaseView {
    
    lazy var scrollView = ImageScrollView()

    override func setupView() {
        super.setupView()
        addSubview(scrollView)
        scrollView.fillSuperview()
    }
}
