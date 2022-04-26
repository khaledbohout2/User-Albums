//
//  ProfileVC+TableViewDelegate.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userAlbums.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumCell = tableView.forceDequeueCell(identifier: AlbumCell.identifier)
        cell.configureCell(album: viewModel.userAlbums[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let albumId = viewModel.userAlbums[indexPath.row].getId() else {return}
        router.navigateToAlbum(from: self, albumID: albumId, title: viewModel.userAlbums[indexPath.row].getTitle() ?? "")
    }
}
