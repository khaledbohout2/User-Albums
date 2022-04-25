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
    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: AlbumDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Album Details"
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

    private func bindViewModel() {

        let stateValueHandler: (AlbumDetailsViewModelState) -> Void = { [weak self] state in
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

        viewModel.$state
            .receive(on: RunLoop.main)
            .sink(receiveValue: stateValueHandler)
            .store(in: &cancellables)

        viewModel.$filteredImages
            .receive(on: RunLoop.main)
            .sink { albums in
                self.mainView.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }
    
    func bindViewToViewModel() {
        mainView.searchTexrField.textPublisher
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak viewModel] in
                viewModel?.search(query: $0)
            }
            .store(in: &cancellables)
    }

}
