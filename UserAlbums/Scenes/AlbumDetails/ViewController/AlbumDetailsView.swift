//
//  AlbumDetailsView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import UIKit

class AlbumDetailsView: BaseView {

    lazy var searchTexrField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .appSilver
        textField.makeRoundedCorner(cornerRadius: 8)
        textField.placeholder = "Search in images.."
        textField.textColor = .appMainText
        textField.setLeftPaddingPoints(5)
        textField.setRightPaddingPoints(5)
        return textField
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.allowsMultipleSelection = false
        collectionView.register(ImageCell.self,
                                forCellWithReuseIdentifier: ImageCell.identifier)
        return collectionView
    }()

    override func setupView() {
        super.setupView()
        addSubview(searchTexrField)
        searchTexrField.anchor(.top(topAnchor, constant: 5),
                               .leading(leadingAnchor, constant: 20),
                               .trailing(trailingAnchor, constant: 20),
                               .height(40))

        addSubview(collectionView)
        collectionView.anchor(.top(searchTexrField.bottomAnchor, constant: 10),
                              .leading(leadingAnchor, constant: 0),
                              .trailing(trailingAnchor, constant: 0),
                              .bottom(bottomAnchor, constant: 10))
    }

    func setDelegates(_ delegate: Any) {
        collectionView.delegate = delegate as? UICollectionViewDelegate
        collectionView.dataSource = delegate as? UICollectionViewDataSource
    }
}
