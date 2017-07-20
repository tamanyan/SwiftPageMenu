//
//  PageMenuNavigationDirection.swift
//  SwiftPageMenu
//
//  Created by Tamanyan on 3/11/29 H.
//  Copyright © 29 Heisei Tamanyan. All rights reserved.
//

import Foundation

@objc public enum PageMenuNavigationDirection: Int {

    /// Forward direction. Can be right in a horizontal orientation or down in a vertical orientation.
    case forward

    /// Reverse direction. Can be left in a horizontal orientation or up in a vertical orientation.
    case reverse
}

extension EMPageViewControllerNavigationDirection {

    var toPageMenuNavigationDirection: PageMenuNavigationDirection {
        switch self {
        case .forward:
            return .forward
        default:
            return .reverse
        }
    }
}
