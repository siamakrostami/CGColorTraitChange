//
//  DeviceTheme.swift
//
//  Created by Siamak on 2/7/24.
//

import Foundation
import UIKit

enum DeviceTheme: Int {
    case device
    case light
    case dark

    // MARK: Internal

    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        @Inject var appData: ApplicationDataContainer
        switch self {
        case .device:
            appData.currentTheme = .unspecified
            appData.currentTrait = .init(userInterfaceStyle: .unspecified)
            return .unspecified
        case .light:
            appData.currentTheme = .light
            appData.currentTrait = .init(userInterfaceStyle: .light)
            return .light
        case .dark:
            appData.currentTheme = .dark
            appData.currentTrait = .init(userInterfaceStyle: .dark)
            return .dark
        }
    }
}
