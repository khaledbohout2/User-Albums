//
//  UIfont+Poppins.swift
//  UserAlbums
//
//  Created by Khaled Bohout on 23/04/2022.
//

import UIKit

extension UIFont {

    public enum PoppinsType: String {
        case regular = "-Regular"
        case semiBold = "-SemiBold"
        case bold = "-Bold"
    }

    static func poppins(_ type: PoppinsType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Poppins\(type.rawValue)", size: size)!
    }

}
