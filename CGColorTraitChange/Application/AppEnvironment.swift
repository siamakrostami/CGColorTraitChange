//
//  AppEnvironment.swift
//  CGColorTraitChange
//
//  Created by Siamak on 4/2/24.
//

import Foundation

// MARK: - AppEnvironment

struct AppEnvironment {}

extension AppEnvironment {
    static func setup() -> Self {
        Dependency.register(ApplicationDataContainer())
        return AppEnvironment()
    }
}
