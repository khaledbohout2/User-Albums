//
//  ProfileViewModel.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import Foundation
import Combine

enum ProfileViewModelState: Equatable {
    case loading
    case finishedLoading
    case error(ProfileViewModelError)
}

enum ProfileViewModelError: Error, Equatable {
    case usersFetch
}

final class ProfileViewModel: ObservableObject {

    private var profileRepository: ProfileRepositoryDelegate
    private var albumRepository: AlbumRepositoryDelegate
    private var cancellables = Set<AnyCancellable>()
    @Published var user: User?
    @Published var userAlbums = [Album]()
    @Published private(set) var state: ProfileViewModelState = .loading

    init(profileRepository: ProfileRepositoryDelegate,
         albumRepository: AlbumRepositoryDelegate) {
        self.profileRepository = profileRepository
        self.albumRepository = albumRepository
        getProfile()
    }

    func getProfile() {
        state = .loading
        profileRepository.getProfile()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .finishedLoading
                    break
                case .failure(_):
                    self?.state = .error(.usersFetch)
                }
            }, receiveValue: { users in
                self.state = .finishedLoading
                self.user = users.randomElement()
                self.getAlbums()
            }).store(in: &self.cancellables)
    }

    func getAlbums() {
        guard let id = user?.id else {return}
        state = .loading
        albumRepository.getAlbums(userId: id)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.state = .finishedLoading
                    break
                case .failure(_):
                    self?.state = .error(.usersFetch)
                }
            }, receiveValue: { [weak self] albums in
                self?.state = .finishedLoading
                self?.userAlbums = albums
            }).store(in: &self.cancellables)
    }

}


