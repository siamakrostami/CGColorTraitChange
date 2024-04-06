//
//  Colors.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Foundation
import UIKit

enum Colors {
    static var Border: UIColor {
        return color(name: "Border")
    }

    static func convertHexToColor(hex: String) -> UIColor {
        switch hex {
            case "#5F5EFF", "#CDE300":
                return Colors.Border
            default:
                return .border
        }
    }
}

extension Colors {
    static func color(name: String) -> UIColor {
        return UIColor(named: name, in: Bundle.main, compatibleWith: nil) ?? .systemBackground
    }
}
