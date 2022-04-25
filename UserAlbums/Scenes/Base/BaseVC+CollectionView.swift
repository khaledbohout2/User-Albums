//
//  BaseVC+CollectionView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class CollectionView: BaseView {
    weak var refreshDelegate: RefreshDelegate?
    let flowLayout = UICollectionViewFlowLayout()

    lazy var collectionView: UICollectionView = {
        let layout = flowLayout
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.refreshControl = refreshControl
        return collectionView
    }()

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .gray
        refreshControl.addTarget(refreshDelegate, action: #selector(refreshDelegate?.refresh), for: .valueChanged)
        return refreshControl
    }()

    lazy var noContentLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.font = .poppins(.regular, size: 18)
        label.isHidden = true
        return label
    }()

    override func setupView() {
        addSubview(collectionView)
        collectionView.fillSuperviewSafeArea(padding: .init(top: 0, left: 20, bottom: 2, right: 20))
        addSubview(noContentLbl)
        noContentLbl.centerXInSuperview()
        noContentLbl.centerYInSuperview()
    }

    func setDelegates(_ delegate: Any) {
        collectionView.delegate = delegate as? UICollectionViewDelegate
        collectionView.dataSource = delegate as? UICollectionViewDataSource
        refreshDelegate = delegate as? RefreshDelegate
    }
}
