//
//  RootViewController.swift
//  PagerExample
//
//  Created by Tamanyan on 3/7/29 H.
//  Copyright © 29 Heisei Tamanyan. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController, UIGestureRecognizerDelegate {

    let titles: [String] = [
        "standard, roundRect",
        "standard, underline",
        "standard, roundRect, customPositionMenu",
        "infinite, roundRect",
        "infinite, underline",
        "infinite, roundRect, bottomMenu",
        "standard, roundRect, storyboard",
    ]

    let items: [[String]] = [
        ["Apple", "Apricot", "Avocado", "Banana", "Blackberry"],
        ["Blueberry", "Cantaloupe", "Cherry", "Cherimoya", "Clementine", "Coconut", "Cranberry", "Cucumber",
         "Custard apple", "Damson", "Date", "Dragonfruit", "Durian", "Elderberry", "Feijoa",],
        ["Fig", "Grape", "Grapefruit", "Guava", "Udara", "Honeyberry", "Huckleberry", "Jabuticaba"],
        ["Jackfruit", "Juniper berry", "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine",],
        ["Mango", "Marionberry"],
        ["Melon", "Nance", "Nectarine", "Olive", "Orange", "Papaya", "Peach"],
        ["Pear", "Pineapple", "Raspberry", "Strawberry", "Tamarillo", "Tamarind", "Tomato", "Ugli fruit", "Yuzu"]
    ]

    let tabTitles: [String] = [
        "Ferthdod",
        "Ga",
        "Mor'gol",
        "Arthos",
        "Daesarnyëdwyr",
        "Thosthorn",
        "Radclifftowne",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Example"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: RoundRectPagerOption())

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 1 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: UnderlinePagerOption())

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 2 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: RoundRectPagerOption(isInfinite: true, tabMenuPosition: .custom))

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 3 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: RoundRectPagerOption(isInfinite: true))

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 4 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: UnderlinePagerOption(isInfinite: true))

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 5 {
            let pageViewController = PageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: RoundRectPagerOption(isInfinite: true, tabMenuPosition: .bottom))
            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        } else if indexPath.row == 6 {
            let pageViewController = StoryboardPageTabMenuViewController(
                items: items,
                titles: tabTitles,
                options: RoundRectPagerOption())

            pageViewController.navigationItem.title = self.titles[indexPath.row]
            self.navigationController?.pushViewController(pageViewController, animated: true)
        }
    }
}
