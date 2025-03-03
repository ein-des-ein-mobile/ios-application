//
//  SignInParams.swift=
//
//  Created by Anton Bal` on 25.09.2022.
//

import Foundation
import Core
import UIKit

extension API.Auth {
    struct SignInParams {
        let username: String
        let password: String
        
        var builder: Parameters {
            Parameters {
                $0.login <- username
                $0.password <- password
            }
        }
    }
}


