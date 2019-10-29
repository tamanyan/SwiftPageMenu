SwiftPageMenu
===================================

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/hsylife/SwiftyPickerPopover)


![1](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/1.gif)
![2](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/2.gif)
![3](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/3.gif)
![4](https://raw.githubusercontent.com/tamanyan/SwiftPageMenu/master/screen_captures/4.gif)


Customizable Page Menu ViewController in Swift

Features

- Infinite Page Menu
- Top / Bottom Position Menu
- Custom Color Menu
- Round Rect / Underline Page Cursor

This library is inspired by [msaps/Pageboy](https://github.com/msaps/Pageboy), [rechsteiner/Parchment](https://github.com/rechsteiner/Parchment), [EndouMari/TabPageViewController](https://github.com/EndouMari/TabPageViewController)

## Requirements

- iOS 10.0+
- Swift 4.2+

## How to use

### Example

Here is an example of how to SwiftPageMenu.

[PageMenuExample/Sources/PageTabMenuViewController.swift](https://github.com/tamanyan/SwiftPageMenu/blob/master/PageMenuExample/Sources/PageTabMenuViewController.swift)

```swift
import UIKit
import SwiftPageMenu
// import Swift_PageMenu if you use cocoapods

class PageTabMenuViewController: PageMenuController {

    let items: [[String]]

    let titles: [String]

    init(items: [[String]], titles: [String], options: PageMenuOptions? = nil) {
        self.items = items
        self.titles = titles
        super.init(options: options)
    }
}

extension PageTabMenuViewController: PageMenuControllerDataSource {

    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController] {
        return self.items.map(ChildViewController.init)
    }

    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String] {
        return self.titles
    }

    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int {
        return 0
    }
}

extension PageTabMenuViewController: PageMenuControllerDelegate {

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
```

### DataSource

SwiftPageMenu supports adding your own custom data sources.

```swift
@objc public protocol PageMenuControllerDataSource: class {

    /// The view controllers to display in the page menu view controller.
    func viewControllers(forPageMenuController pageMenuController: PageMenuController) -> [UIViewController]

    /// The view controllers to display in the page menu view controller.
    func menuTitles(forPageMenuController pageMenuController: PageMenuController) -> [String]

    /// The default page index to display in the page menu view controller.
    func defaultPageIndex(forPageMenuController pageMenuController: PageMenuController) -> Int
}
```

### Delegate

SwiftPageMenu give you the events below code.

```swift
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
```

### Customization

It is easy to customize SwiftPageMenu. All customization is handled by the PageMenuOptions protocol.
You can create own struct that conforms to this protocol.

```swift
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
        return UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1)
    }

    var menuCursor: PageMenuCursor {
        return .roundRect(rectColor: .white, cornerRadius: 10, height: 22)
    }

    var font: UIFont {
        return .systemFont(ofSize: UIFont.systemFontSize)
    }

    var menuItemMargin: CGFloat {
        return 8
    }

    var tabMenuBackgroundColor: UIColor {
        return UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1)
    }

    var tabMenuContentInset: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }

    public init(isInfinite: Bool = false, tabMenuPosition: TabMenuPosition = .top) {
        self.isInfinite = isInfinite
        self.tabMenuPosition = tabMenuPosition
    }
}
```

### Carthage

To integrate SwiftPageMenu into your Xcode project using Carthage, specify it in your Cartfile:

```ruby
github "tamanyan/SwiftPageMenu"
```

### CocoaPods

```
target 'MyApp' do
  use_frameworks!
  pod 'Swift_PageMenu', '~> 1.4'
end
```

## License

MIT license. See the LICENSE file for more info.
