//
//  PanBlockGestureRecognizer.swift
//  SwiftPageMenu
//
//  Created by Taketo Yoshida on 11/1/29 H.
//  Copyright © 29 Heisei Tamanyan. All rights reserved.
//

import UIKit

class PanBlockGestureRecognizerDelegate: NSObject, UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

class PanBlockGestureRecognizer: UIPanGestureRecognizer {

    fileprivate var panBlockGestureRecognizerDelegate = PanBlockGestureRecognizerDelegate()

    var inView: UIView?

    var isEnded: Bool = false

    var beginPanLocation: CGPoint = .zero

    var endPanLocation: CGPoint = .zero

    init(in view: UIView) {
        super.init(target: nil, action: nil)

        self.addTarget(self, action: #selector(self.performAction(sender:)))
        self.inView = view
        self.delegate = self.panBlockGestureRecognizerDelegate
    }

    @objc func performAction(sender: UIGestureRecognizer) {
        guard let panGesture = sender as? UIPanGestureRecognizer else { return }
        let state = panGesture.state
        let panLocation = panGesture.location(in: self.inView)
        let permissionVertical: CGFloat = 10
        let swipeStroke: CGFloat = 10

        if state == .began {
            self.beginPanLocation = panLocation
            self.isEnded = false
        } else if state == .changed && self.isEnded == false {
            self.endPanLocation = panLocation
            let moveX = self.endPanLocation.x - self.beginPanLocation.x
            let moveY = self.endPanLocation.y - self.beginPanLocation.y
            let absX = abs(moveX)
            let absY = abs(moveY)

            if absY < permissionVertical && absX > swipeStroke {
                panGesture.setValue(UIGestureRecognizer.State.cancelled.rawValue, forKey: "state")
                // self.isEnded = true
            } else if absY > permissionVertical {
                self.isEnded = true
                // panGesture.setValue(UIGestureRecognizerState.ended.rawValue, forKey: "state")
            }
        }
    }
}
