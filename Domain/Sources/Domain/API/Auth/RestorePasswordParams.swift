//
//  RestorePasswordParams.swift
//  Application
//
//  Created by Anton Bal’ on 13.03.2024.
//

import Foundation
import Core

extension API.Auth {
    struct RestorePasswordParams {
        let email: String
        
        var builder: Parameters {
            Parameters {
                $0.email <- email
            }
        }
    }
}
