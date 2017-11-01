//
//  PageMenuControllerDataSource.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/9/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation

@objc public protocol PageMenuControllerDataSource: class {

    /// The view controllers to display in the page menu view controller.
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController]

    /// The view controllers to display in the page menu view controller.
    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String]

    /// The default page index to display in the page menu view controller.
    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int
}
