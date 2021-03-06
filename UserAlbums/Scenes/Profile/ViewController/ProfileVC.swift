//
//  ProfileVC.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import Combine
import UIKit

class ProfileVC: BaseVC<ProfileView> {
    var viewModel: ProfileViewModel
    var router: ProfileVCRouter
    private var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: ProfileViewModel, router: ProfileVCRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setLeftNavTitle("Profile")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.setDelegates(self)
        bindViewModel()
    }
    
    func stateValueHandler() -> (ProfileViewModelState) -> Void {
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

        viewModel.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  user in
                self?.mainView.nameLbl.text = user?.name
                self?.mainView.addressLbl.text = user?.address?.formatAddress()
            }
            .store(in: &cancellables)

        viewModel.$userAlbums
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  albums in
                self?.mainView.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

}
