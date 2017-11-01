//
//  TabMenuItemCursor.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/10/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation

protocol TabMenuItemCursor: class {

    var isHidden: Bool { get set }

    func setup(parent: UIView, isInfinite: Bool, options: PageMenuOptions)

    func updateWidth(width: CGFloat)

    func updatePosition(x: CGFloat)
}
