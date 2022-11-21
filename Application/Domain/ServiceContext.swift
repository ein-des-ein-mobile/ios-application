//
//  ServiceContext.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import Core

final class ServiceContext {
    
    /// Networking
    let networking: Networking
    
    /// Database
    let database: any DatabaseProvider
    
    let secureStorage: any Storagable
    
    let userStorage: any Storagable

    ///
    /// FileManager
    /// etc
    ///

    init(networking: Networking,
         database: any DatabaseProvider,
         secureStorage: any Storagable,
         userStorage: any Storagable) {
        self.networking = networking
        self.database = database
        self.secureStorage = secureStorage
        self.userStorage = userStorage
    }
}
