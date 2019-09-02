//
//  StoryboardPageTabMenuViewController.swift
//  PageMenuExample
//
//  Created by Tamanyan on 9/3/31 H.
//  Copyright © 31 Heisei Tamanyan. All rights reserved.
//

import UIKit
import SwiftPageMenu

class StoryboardPageTabMenuViewController: PageMenuController {

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

        if options.layout == .layoutGuide && options.tabMenuPosition == .bottom {
            self.view.backgroundColor = Theme.mainColor
        } else {
            self.view.backgroundColor = .white
        }

        if self.options.tabMenuPosition == .custom {
            self.view.addSubview(self.tabMenuView)
            self.tabMenuView.translatesAutoresizingMaskIntoConstraints = false

            self.tabMenuView.heightAnchor.constraint(equalToConstant: self.options.menuItemSize.height).isActive = true
            self.tabMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
            self.tabMenuView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
            if #available(iOS 11.0, *) {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            } else {
                self.tabMenuView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            }
        }

        self.delegate = self
        self.dataSource = self
    }
}

extension StoryboardPageTabMenuViewController: PageMenuControllerDataSource {
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController] {
        return self.titles.enumerated().map({ (i, title) -> UIViewController in
            let storyboard = UIStoryboard(name: "StoryboardChildViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "StoryboardChildViewController") as! StoryboardChildViewController

            controller.title = "Storyboard #\(i) (\(title))"

            return controller
        })
    }

    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String] {
        return self.titles
    }

    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int {
        return 0
    }
}

extension StoryboardPageTabMenuViewController: PageMenuControllerDelegate {
    func pageMenuController(_ pageMenuController: PageMenuController, didScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller will begin scrolling to a new page.
        print("didScrollToPageAtIndex index:\(index)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, willScrollToPageAtIndex index: Int, direction: PageMenuNavigationDirection) {
        // The page view controller scroll progress between pages.
        print("willScrollToPageAtIndex index:\(index)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, scrollingProgress progress: CGFloat, direction: PageMenuNavigationDirection) {
        // The page view controller did complete scroll to a new page.
        print("scrollingProgress progress: \(progress)")
    }

    func pageMenuController(_ pageMenuController: PageMenuController, didSelectMenuItem index: Int, direction: PageMenuNavigationDirection) {
        print("didSelectMenuItem index: \(index)")
    }
}
