//
//  SignInParams.swift=
//
//  Created by Anton Bal` on 25.09.2022.
//

import Foundation
import Core

struct SignInParams {
    let username: String
    let password: String

    var builder: Parameters {
        Parameters {
            $0.username <- username
            $0.password <- password
        }
    }
}
