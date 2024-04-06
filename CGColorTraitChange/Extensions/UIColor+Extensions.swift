//
//  UIColor+Extensions.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Foundation
import UIKit

extension UIColor {
    func hexString() -> String {
        guard let components = cgColor.components, components.count >= 3 else {
            return ""
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])

        return String(format: "#%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
    }
}
