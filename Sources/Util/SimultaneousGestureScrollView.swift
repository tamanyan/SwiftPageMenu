//
//  SimultaneousGestureScrollView.swift
//  SwiftPageMenu
//
//  Created by Taketo Yoshida on 11/1/29 H.
//  Copyright © 29 Heisei Tamanyan. All rights reserved.
//

import UIKit

/**
 ScrollView for swiping without stop scrolling tableview
 */
class SimultaneousGestureScrollView: UIScrollView {

    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let velocity = panGestureRecognizer.velocity(in: self)

            if abs(velocity.y) * 2 < abs(velocity.x) {
                return true
            }
        }

        return false
    }
}
