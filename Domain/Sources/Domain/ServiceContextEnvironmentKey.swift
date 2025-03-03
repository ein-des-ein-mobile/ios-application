//
//  ServiceContextEnvironmentKey.swift
//  Application
//
//  Created by Anton Bal’ on 02.03.2025.
//

import Foundation
import SwiftUICore
import Core

private struct ServiceContextEnvironmentKey: EnvironmentKey {
    static var defaultValue: ServiceContext {
        let authPlugin = AuthorizationPlugin<User, SessionService>()
        
        return ServiceContext(
            networking: Network(environment: AppEnvironment.current, plugins: [authPlugin]),
            secureStorage: KeychainStorage(),
            userStorage: DefaultsStorage()
        )
    }
}

public extension EnvironmentValues {
    var context: ServiceContext {
        get { self[ServiceContextEnvironmentKey.self] }
        set { self[ServiceContextEnvironmentKey.self] = newValue }
    }
}
