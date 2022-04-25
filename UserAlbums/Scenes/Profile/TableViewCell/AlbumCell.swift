//
//  AlbumCell.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class AlbumCell: UITableViewCell {

    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.textColor = .appBase100
        label.font = .poppins(.regular, size: 14)
        label.numberOfLines = 0
        return label
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        accessoryType = .disclosureIndicator

        contentView.addSubview(titleLbl)
        titleLbl.anchor(.leading(contentView.leadingAnchor, constant: 14),
                        .top(contentView.topAnchor, constant: 15),
                        .bottom(contentView.bottomAnchor, constant: 15),
                        .trailing(contentView.trailingAnchor, constant: 20))
    }

    func configureCell(title: String) {
        titleLbl.text = title
    }

}
