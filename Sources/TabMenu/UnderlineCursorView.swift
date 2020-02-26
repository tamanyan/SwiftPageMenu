//
//  UnderlineCursorView.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/10/17.
//  Copyright © 2017 Tamanyan. All rights reserved.
//

import UIKit

class UnderlineCursorView: UIView, TabMenuItemCursor {

    fileprivate var currentBarViewWidthConstraint: NSLayoutConstraint?

    fileprivate var currentBarViewLeftConstraint: NSLayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(parent: UIView, isInfinite: Bool, options: PageMenuOptions) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if isInfinite {
            parent.addSubview(self)
            self.heightAnchor.constraint(equalToConstant: options.menuCursor.height).isActive = true
            self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
            self.currentBarViewWidthConstraint = self.widthAnchor.constraint(equalToConstant: 100)
            self.currentBarViewWidthConstraint?.isActive = true
        } else {
            parent.addSubview(self)
            self.heightAnchor.constraint(equalToConstant: options.menuCursor.height).isActive = true
            self.topAnchor.constraint(equalTo: parent.topAnchor, constant: options.menuItemSize.height - options.menuCursor.height).isActive = true
            self.currentBarViewWidthConstraint = self.widthAnchor.constraint(equalToConstant: 100)
            self.currentBarViewWidthConstraint?.isActive = true
            self.currentBarViewLeftConstraint = self.leftAnchor.constraint(equalTo: parent.leftAnchor)
            self.currentBarViewLeftConstraint?.isActive = true
        }
    }

    func updateWidth(width: CGFloat) {
        self.currentBarViewWidthConstraint?.constant = width - 14
    }

    func updatePosition(x: CGFloat) {
        self.currentBarViewLeftConstraint?.constant = x + 7
    }
}
