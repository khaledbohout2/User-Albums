//
//  ImageScrollView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 25/04/2022.
//

import UIKit

final class ImageScrollView: UIScrollView {
    
    private let imageView = UIImageView()
    
    required init() {
        super.init(frame: .zero)
        addSubview(imageView)
        imageView.fillSuperview()
        
        contentInsetAdjustmentBehavior = .never
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        alwaysBounceHorizontal = true
        alwaysBounceVertical = true
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helper methods
    
     func setZoomScale() {
        let widthScale = frame.size.width / imageView.bounds.width
        let heightScale = frame.size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        minimumZoomScale = minScale
        zoomScale = minScale
    }
    
    func loadImage(image: String) {
        imageView.load(with: image)
    }
}

extension ImageScrollView: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let yOffset = max(0, (bounds.size.height - imageView.frame.height) / 2)
        imageView.anchor(.top(topAnchor, constant: yOffset))
        imageView.anchor(.top(bottomAnchor, constant: yOffset))
        
        let xOffset = max(0, (bounds.size.width - imageView.frame.width) / 2)
        imageView.anchor(.leading(leadingAnchor, constant: xOffset),
                         .trailing(trailingAnchor, constant: xOffset))
        
        
        layoutIfNeeded()
    }
}
