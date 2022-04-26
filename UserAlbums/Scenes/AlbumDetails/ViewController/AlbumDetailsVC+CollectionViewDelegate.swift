//
//  AlbumDetailsVC+CollectionViewDelegate.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import UIKit

extension AlbumDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredImages.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ImageCell =
        collectionView.forceDequeueCell(
            identifier: ImageCell.identifier,
            for: indexPath
        )
        cell.configure(image: viewModel.filteredImages[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = viewModel.images[indexPath.row].url else {return}
        router.navigateToImagePreview(from: self, image: url)
    }
}

extension AlbumDetailsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsPerRow: CGFloat = traitCollection.horizontalSizeClass == .regular ? 6 : 3
        let width = collectionView.frame.width / noOfCellsPerRow
        return CGSize(width: width, height: width)
    }
}
