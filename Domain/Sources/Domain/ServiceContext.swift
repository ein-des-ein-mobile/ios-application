//
//  ServiceContext.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import Core

public final class ServiceContext {
    
    /// Networking
    let networking: Networking
    
    let secureStorage: any Storagable
    
    let userStorage: any Storagable

    ///
    /// FileManager
    /// etc
    ///

    init(networking: Networking,
         secureStorage: any Storagable,
         userStorage: any Storagable) {
        self.networking = networking
        self.secureStorage = secureStorage
        self.userStorage = userStorage
    }
}
