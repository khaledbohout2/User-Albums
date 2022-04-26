//
//  ImagePreviewVC.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit

class ImagePreviewVC: BaseVC<ImageViewerView> {
    
    let image: String

    init(image: String) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
        mainView.scrollView.loadImage(image: image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        addShareNavButton().addTarget {[weak self] in
            guard let self = self else { return }
            let items = [self.image]
            let activityController = UIActivityViewController(activityItems: items, applicationActivities: [])
            activityController.popoverPresentationController?.sourceView = self.mainView.scrollView
            self.present(activityController, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        mainView.scrollView.setZoomScale()
    }
}



