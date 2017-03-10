//
//  PageMenuControllerDelegate.swift
//  SwiftPager
//
//  Created by Tamanyan on 3/9/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation

public protocol PageMenuControllerDelegate: class {
    /// The page view controller will begin scrolling to a new page.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             willScrollToPageAtIndex index: Int,
                             direction: EMPageViewControllerNavigationDirection)
    
    /// The page view controller scroll progress between pages.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             scrollingProgress progress: CGFloat,
                             direction: EMPageViewControllerNavigationDirection)
    
    /// The page view controller did complete scroll to a new page.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             didScrollToPageAtIndex index: Int,
                             direction: EMPageViewControllerNavigationDirection)
}
