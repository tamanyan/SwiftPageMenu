SwiftPageMenu
===================================

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/hsylife/SwiftyPickerPopover)


![1](https://cloud.githubusercontent.com/assets/2387508/24037077/c537134e-0b3f-11e7-93c2-a2f1184004c4.gif)
![2](https://cloud.githubusercontent.com/assets/2387508/24037081/c8e18164-0b3f-11e7-855c-fe9e3dde4807.gif)
![3](https://cloud.githubusercontent.com/assets/2387508/24037083/ca610848-0b3f-11e7-82e2-283faa25a859.gif)
![4](https://cloud.githubusercontent.com/assets/2387508/24037086/cbf66c0c-0b3f-11e7-9967-cf1d5610b256.gif)

Customizable Page Menu ViewController in Swift

Features

- Infinite Page Menu
- Top / Bottom Position Menu
- Custom Color Menu
- Round Rect / Underline Page Cursor

This framework is reference by [msaps/Pageboy](https://github.com/msaps/Pageboy), [rechsteiner/Parchment](https://github.com/rechsteiner/Parchment), [EndouMari/TabPageViewController](https://github.com/EndouMari/TabPageViewController)

## Requirements

- iOS 9.0+
- Swift 3

## How to use

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
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }

    var menuItemMargin: CGFloat {
        return 8
    }

    var tabMenuBackgroundColor: UIColor {
        return UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1)
    }

    public init(isInfinite: Bool = false, tabMenuPosition: TabMenuPosition = .top) {
        self.isInfinite = isInfinite
        self.tabMenuPosition = tabMenuPosition
    }
}
```

### Carthage

To integrate ViewPagerController into your Xcode project using Carthage, specify it in your Cartfile:

```ruby
github "tamanyan/SwiftPageMenu"
```````

## License

MIT license. See the LICENSE file for more info.
