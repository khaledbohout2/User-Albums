//
//  AlbumDetailsVC.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 24/04/2022.
//

import Combine
import UIKit

class AlbumDetailsVC: BaseVC<AlbumDetailsView> {
    var viewModel: AlbumDetailsViewModel
    var router: AlbumDetailsVCRouter
    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: AlbumDetailsViewModel, router: AlbumDetailsVCRouter, title: String) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setCenterNavTitle(title)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setDelegates(self)
        bindViewModel()
        bindViewToViewModel()
    }

    func stateValueHandler() -> (AlbumDetailsViewModelState) -> Void {
        return { [weak self] state in
            switch state {
            case .loading:
                self?.startLoading()
            case .finishedLoading:
                self?.stopLoading()
            case .error(let error):
                self?.stopLoading()
                self?.showSelfDismissingAlert(error.localizedDescription)
            }
        }
    }

    private func bindViewModel() {
        
        let stateValueHandler = stateValueHandler()

        viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &cancellables)

        viewModel.$filteredImages
            .receive(on: DispatchQueue.main)
            .sink { [weak self] albums in
                self?.mainView.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }

    func bindViewToViewModel() {
        mainView.searchTexrField.textPublisher
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak viewModel] in
                viewModel?.search(query: $0)
            }
            .store(in: &cancellables)
    }

}
