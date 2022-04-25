//
//  AlbumDetailsViewModel.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import Foundation
import Combine

enum AlbumDetailsViewModelState: Equatable {
    case loading
    case finishedLoading
    case error(AlbumDetailsViewModelError)
}

enum AlbumDetailsViewModelError: Error, Equatable {
    case usersFetch
}

final class AlbumDetailsViewModel: ObservableObject {

    private var repository: AlbumRepositoryDelegate
    private var cancellables = Set<AnyCancellable>()
    var albumId: Int
    @Published var images = [Image]()
    @Published var filteredImages = [Image]()
    @Published private(set) var state: AlbumDetailsViewModelState = .loading

    init(repository: AlbumRepositoryDelegate, albumId: Int) {
        self.repository = repository
        self.albumId = albumId
        getPhotos()
    }

    func getPhotos() {
        state = .loading
        repository.getPhotos(albumId: albumId) { [weak self] result in
            guard let self = self else {return}
            result.sink { error in
                self.state = .error(.usersFetch)
            } receiveValue: { images in
                self.state = .finishedLoading
                self.images = images
                self.filteredImages = images
            }.store(in: &self.cancellables)
        }
    }

    func search(query: String?) {
        guard let query = query else {
            filteredImages = images
            return
        }
        if query.count == 0 {
            filteredImages = images
        } else if query.count > 0 {
            filteredImages = images.filter { $0.title?.contains(query) ?? false }
        }
    }

}