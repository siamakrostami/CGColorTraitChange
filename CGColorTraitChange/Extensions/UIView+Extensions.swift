//
//  UIView+Extensions.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Foundation
import UIKit

extension UIView {
    func allSubviews() -> [UIView] {
        var allSubviews = [UIView]()
        var queue = [self]

        while let currentView = queue.popLast() {
            allSubviews.append(currentView)
            queue += currentView.subviews
        }

        return allSubviews
    }
}
