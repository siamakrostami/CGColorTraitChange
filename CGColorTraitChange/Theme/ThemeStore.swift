//
//  ThemeStore.swift
//
//  Created by Siamak on 2/7/24.
//

import Foundation

enum ThemeStore {
    static var theme: DeviceTheme {
        get {
            return DeviceTheme(rawValue: UserDefaults.standard.object(forKey: "selectedTheme") as? Int ?? 0) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
