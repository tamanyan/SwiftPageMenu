//
//  PageMenuControllerDataSource.swift
//  SwiftPager
//
//  Created by Tamanyan on 3/9/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import Foundation

public protocol PageMenuControllerDataSource: class {
    /// The view controllers to display in the Pageboy view controller.
    func viewControllers(forPageMenuController pageboyViewController: PageMenuController) -> [UIViewController]

    /// The view controllers to display in the Pageboy view controller.
    func menuTitles(forPageMenuController pageboyViewController: PageMenuController) -> [String]

    /// The default page index to display in the Pageboy view controller.
    func defaultPageIndex(forPageMenuController pageboyViewController: PageMenuController) -> Int?
}
