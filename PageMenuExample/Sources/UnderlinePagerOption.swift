//
//  UnderlinePagerOption.swift
//  PageMenuExample
//
//  Created by Tamanyan on 3/10/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation
import SwiftPageMenu

struct UnderlinePagerOption: PageMenuOptions {

    var isInfinite: Bool = false

    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 30)
    }
    
    var menuTitleColor: UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
    var menuTitleSelectedColor: UIColor {
        return Theme.mainColor
    }
    
    var menuCursor: PageMenuCursor {
        return .underline(barColor: Theme.mainColor, height: 2)
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
        return .white
    }
    
    public init(isInfinite: Bool = false) {
        self.isInfinite = isInfinite
    }
}
