//
//  ApplicationDataContainer.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Combine
import Foundation
import UIKit

class ApplicationDataContainer {
    @Published var currentTheme: UIUserInterfaceStyle = .unspecified
    @Published var currentTrait: UITraitCollection = .init(userInterfaceStyle: .unspecified)
}
