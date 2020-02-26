//
//  TabMenuItemCell.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/9/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import UIKit

class TabMenuItemCell: UICollectionViewCell {

    static var cellIdentifier: String {
        return "TabMenuItemCell"
    }

    var options: PageMenuOptions?

    fileprivate var itemLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .center
        label.backgroundColor = .clear

        return label
    }()

    var decorationView: UIView?

    var isDecorationHidden: Bool = true {
        didSet {
            guard let options = options, options.isInfinite else {
                return
            }

            if self.isDecorationHidden {
                self.removeDecorationView()
            } else {
                self.removeDecorationView()
                switch options.menuCursor {
                case let .underline(barColor, _):
                    let underlineView = UnderlineCursorView(frame: .zero)
                    underlineView.setup(parent: self, isInfinite: true, options: options)
                    underlineView.backgroundColor = barColor
                    underlineView.updateWidth(width: self.frame.width)
                    self.decorationView = underlineView
                case let .roundRect(rectColor, cornerRadius, _, borderWidth, borderColor):
                    let rectView = RoundRectCursorView(frame: .zero)
                    rectView.setup(parent: self, isInfinite: true, options: options)
                    rectView.backgroundColor = rectColor
                    rectView.layer.cornerRadius = cornerRadius
                    if let borderWidth = borderWidth, let borderColor = borderColor {
                        rectView.layer.borderWidth = borderWidth
                        rectView.layer.borderColor = borderColor.cgColor
                    }
                    rectView.updateWidth(width: self.frame.width)
                    self.decorationView = rectView
                }
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .clear

        self.contentView.addSubview(self.itemLabel)
        self.itemLabel.translatesAutoresizingMaskIntoConstraints = false
        self.itemLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.itemLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, options: PageMenuOptions) {
        self.options = options
        self.itemLabel.text = title
        self.itemLabel.invalidateIntrinsicContentSize()
        self.invalidateIntrinsicContentSize()
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        if self.itemLabel.text?.count == 0 {
            return .zero
        }

        return self.intrinsicContentSize
    }

    func removeDecorationView() {
        self.decorationView?.removeFromSuperview()
        self.decorationView = nil
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.removeDecorationView()
    }
}


// MARK: - View

extension TabMenuItemCell {
    override var intrinsicContentSize: CGSize {
        guard let options = self.options else {
            return .zero
        }

        switch options.menuItemSize {
        case .fixed(let tabWidth, let tabHeight):
            return CGSize(width: tabWidth + options.menuItemMargin * 2, height: tabHeight)
        case .sizeToFit(let minWidth, let tabHeight):
            let tabWidth = itemLabel.intrinsicContentSize.width + options.menuItemMargin * 2
            return CGSize(width: (minWidth > tabWidth ? minWidth : tabWidth) + options.menuItemMargin * 2, height: tabHeight)
        }
    }

    func highlightTitle(progress: CGFloat = 1.0) {
        guard let options = self.options else {
            return
        }
        
        self.itemLabel.font = options.menuTitleSelectedfont
        self.itemLabel.textColor = UIColor.interpolate(
            from: options.menuTitleColor,
            to: options.menuTitleSelectedColor,
            with: progress)
    }

    func unHighlightTitle(progress: CGFloat = 1.0) {
        guard let options = self.options else {
            return
        }

        self.itemLabel.font = options.menuTitleFont
        self.itemLabel.textColor = UIColor.interpolate(
            from: options.menuTitleSelectedColor,
            to: options.menuTitleColor,
            with: progress)
    }
}
