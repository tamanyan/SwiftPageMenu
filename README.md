SwiftPageMenu
===================================

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/hsylife/SwiftyPickerPopover)

<img src="https://cloud.githubusercontent.com/assets/2387508/23804879/176b2b6e-05ff-11e7-80fc-b9503274efca.gif" width="200">
<img src="https://cloud.githubusercontent.com/assets/2387508/23804906/29aa2d98-05ff-11e7-80e4-1a86c504bea9.gif" width="200">
<img src="https://cloud.githubusercontent.com/assets/2387508/23804881/17a2157a-05ff-11e7-9f5e-e2f0966565b3.gif" width="200">
<img src="https://cloud.githubusercontent.com/assets/2387508/23804882/17a56fb8-05ff-11e7-8764-9495d8e7e01d.gif" width="200">

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
public protocol PageMenuControllerDataSource: class {
    /// The view controllers to display in the Pageboy view controller.
    func viewControllers(forPageMenuController pageboyViewController: PageMenuController) -> [UIViewController]

    /// The view controllers to display in the Pageboy view controller.
    func menuTitles(forPageMenuController pageboyViewController: PageMenuController) -> [String]

    /// The default page index to display in the Pageboy view controller.
    func defaultPageIndex(forPageMenuController pageboyViewController: PageMenuController) -> Int
}
```

### Delegate

SwiftPageMenu give you the events below code.

```swift
public protocol PageMenuControllerDelegate: class {
    /// The page view controller will begin scrolling to a new page.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             willScrollToPageAtIndex index: Int,
                             direction: PageMenuNavigationDirection)

    /// The page view controller scroll progress between pages.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             scrollingProgress progress: CGFloat,
                             direction: PageMenuNavigationDirection)

    /// The page view controller did complete scroll to a new page.
    func pageMenuViewController(_ pageMenuViewController: PageMenuController,
                             didScrollToPageAtIndex index: Int,
                             direction: PageMenuNavigationDirection)
}`
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
