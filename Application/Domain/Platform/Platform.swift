//
//  Platform.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import Core

final class Platform: UseCaseProvider {
    
    let sessionUseCase: any SessionUseCase
    
    init(environment: NetworkEnvironment) {
        
        let authPlugin = AuthorizationPlugin<User, SessionSerivce>()
        let networking = Network(environment: environment, plugins: [authPlugin])
        
        let context = ServiceContext(networking: networking,
                                     database: CoreDataDatabase(persistentContainerName: "core-data"),
                                     secureStorage: KeychainStorage(),
                                     userStorage: DefaultsStorage())
        
        self.sessionUseCase = SessionSerivce(context: context)
    }
}
