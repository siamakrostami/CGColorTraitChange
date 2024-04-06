//
//  Dependency.swift
//
//  Created by Siamak on 8/26/23.
//

import Foundation

final class Dependency {
    private static let shared = Dependency()
    private var dependencies = [String: AnyObject]()
    
    private init() {}
}

extension Dependency {
    static func register<T>(_ dependency: T) {
        shared.register(dependency)
    }
    
    static func resolve<T>() -> T {
        shared.resolve()
    }
    
    private func register<T>(_ dependency: T) {
        let key = String(describing: T.self)
        dependencies[key] = dependency as AnyObject
    }
    
    private func resolve<T>() -> T {
        let key = String(describing: T.self)
        let dependency = dependencies[key] as? T
        
        precondition(dependency != nil, "No dependency found for \(key)! must register a dependency before resolve.")
        
        return dependency!
    }
}
