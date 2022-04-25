//
//  ImagePreviewVC.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit

class ImagePreviewVC: BaseVC<ImageViewerView> {

    init(image: String) {
        super.init(nibName: nil, bundle: nil)
        mainView.scrollView.loadImage(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {}
    
    override func viewDidLayoutSubviews() {
        mainView.scrollView.setZoomScale()
    }
}



