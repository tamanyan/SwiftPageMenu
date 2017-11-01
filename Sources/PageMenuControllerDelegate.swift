//
//  PageMenuControllerDelegate.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/9/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation

@objc public protocol PageMenuControllerDelegate: class {

    /// The page view controller will begin scrolling to a new page.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           willScrollToPageAtIndex index: Int,
                                           direction: PageMenuNavigationDirection)

    /// The page view controller scroll progress between pages.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           scrollingProgress progress: CGFloat,
                                           direction: PageMenuNavigationDirection)

    /// The page view controller did complete scroll to a new page.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           didScrollToPageAtIndex index: Int,
                                           direction: PageMenuNavigationDirection)

    /// The menu item of page view controller are selected.
    @objc optional func pageMenuController(_ pageMenuController: PageMenuController,
                                           didSelectMenuItem index: Int,
                                           direction: PageMenuNavigationDirection)
}
