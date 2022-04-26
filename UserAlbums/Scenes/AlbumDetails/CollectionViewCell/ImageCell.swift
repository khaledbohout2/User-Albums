//
//  ImageCell.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import UIKit

class ImageCell: UICollectionViewCell {

    lazy var image: UIImageView = { return UIImageView() }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        setupLayOut()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayOut() {
        contentView.backgroundColor = UIColor.appBackground
        contentView.addSubview(image)
        image.fillSuperview()
    }

    func configure(image: Image) {
        self.image.load(with: image.thumbnailURL ?? "")
    }
}
