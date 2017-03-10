//
//  PageTabMenuViewController.swift
//  PagerExample
//
//  Created by Tamanyan on 3/7/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import UIKit
import SwiftPageMenu

class PageTabMenuViewController: PageMenuController {
    let items: [[String]]
    let titles: [String]

    init(items: [[String]], titles: [String], options: PageMenuOptions? = nil) {
        self.items = items
        self.titles = titles
        super.init(options: options)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = .white

        self.delegate = self
        self.dataSource = self
    }
}

extension PageTabMenuViewController: PageMenuControllerDataSource {
    func viewControllers(forPageMenuController pageMenuViewController: PageMenuController) -> [UIViewController] {
        return self.items.map(ChildViewController.init)
    }

    func menuTitles(forPageMenuController pageMenuViewController: PageMenuController) -> [String] {
        return self.titles
    }

    func defaultPageIndex(forPageMenuController pageMenuViewController: PageMenuController) -> Int {
        return 0
    }
}

extension PageTabMenuViewController: PageMenuControllerDelegate {
    func pageMenuViewController(_ pageMenuViewController: PageMenuController, didScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller will begin scrolling to a new page.
    }

    func pageMenuViewController(_ pageMenuViewController: PageMenuController, willScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller scroll progress between pages.
    }

    func pageMenuViewController(_ pageMenuViewController: PageMenuController, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
        // The page view controller did complete scroll to a new page.
    }
}
