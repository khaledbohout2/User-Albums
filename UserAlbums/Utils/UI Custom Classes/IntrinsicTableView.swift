//
//  IntrinsicTableView.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

class IntrinsicTableView: UITableView {

    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }

}
