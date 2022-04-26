//
//  ProfileView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class ProfileView: BaseView {

    lazy var nameLbl: UILabel = {
        let label = UILabel()
        return label
    }()

    lazy var addressLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    lazy var tableView: IntrinsicTableView = {
        let tableView = IntrinsicTableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.bounces = false
        tableView.makeRoundedCorner(cornerRadius: 16)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AlbumCell.self,
                           forCellReuseIdentifier: AlbumCell.identifier)
        return tableView
    }()

    lazy var seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()

    override func setupView() {
        super.setupView()
        addSubview(nameLbl)
        nameLbl.anchor(.top(topAnchor, constant: 5),
                       .leading(leadingAnchor, constant: 20),
                       .trailing(trailingAnchor, constant: 20))

        addSubview(addressLbl)
        addressLbl.anchor(.top(nameLbl.bottomAnchor, constant: 12),
                          .leading(leadingAnchor, constant: 20),
                          .trailing(trailingAnchor, constant: 20))

        addSubview(tableView)
        tableView.anchor(.top(addressLbl.bottomAnchor, constant: 20),
                         .leading(leadingAnchor, constant: 20),
                         .trailing(trailingAnchor, constant: 20))

        addSubview(seperatorView)
        seperatorView.anchor(.top(tableView.bottomAnchor, constant: 0),
                             .leading(leadingAnchor, constant: 0),
                             .trailing(trailingAnchor, constant: 0))
        let heightAnchor = seperatorView.heightAnchor.constraint(greaterThanOrEqualToConstant: 35)
        heightAnchor.priority = .required
        heightAnchor.isActive = true

    }

    func setDelegates(_ delegate: Any) {
        tableView.delegate = delegate as? UITableViewDelegate
        tableView.dataSource = delegate as? UITableViewDataSource
    }
}
