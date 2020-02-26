//
//  RoundRectPageMenuOptions.swift
//  PageMenuExample
//
//  Created by Tamanyan on 3/10/29 H.
//  Copyright © 29 Heisei Tamanyan. All rights reserved.
//

import Foundation
import SwiftPageMenu

struct RoundRectPagerOption: PageMenuOptions {

    var isInfinite: Bool = false

    var tabMenuPosition: TabMenuPosition = .top

    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 30)
    }

    var menuTitleColor: UIColor {
        return .white
    }

    var menuTitleSelectedColor: UIColor {
        return Theme.mainColor
    }

    var menuCursor: PageMenuCursor {
        return .roundRect(rectColor: .white, cornerRadius: 10, height: 22, borderWidth: nil, borderColor: nil)
    }

    var menuTitleFont: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
    
    var menuTitleSelectedfont: UIFont {
        return UIFont.boldSystemFont(ofSize: 16)
    }
    
    var menuItemMargin: CGFloat {
        return 8
    }

    var tabMenuBackgroundColor: UIColor {
        return Theme.mainColor
    }

    var tabMenuContentInset: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }

    public init(isInfinite: Bool = false, tabMenuPosition: TabMenuPosition = .top) {
        self.isInfinite = isInfinite
        self.tabMenuPosition = tabMenuPosition
    }
}
