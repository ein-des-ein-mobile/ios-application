//
//  API+Auth.swift=
//
//  Created by Anton Bal` on 25.09.2022.
//

import Foundation
import Core

extension API {

    enum Auth: RequestConvertible {

        case signIn(SignInParams)
        case restorePassword(RestorePasswordParams)
        case signOut

        var path: String {
            switch self {
            case .signIn:
                return "signIn"
                
            case .signOut:
                return "signOut"
                
            case .restorePassword:
                return "restorePassword"
            }
        }

        var method: HTTPMethod {
            .post
        }

        var task: NetworkTask {
            switch self {
            case .signIn(let params):
                return .requestParameters(parameters: params.builder.make())
            case .restorePassword (let params):
                return .requestParameters(parameters: params.builder.make())
            case .signOut:
                return .requestPlain
            }
        }

        var authorizationStrategy: AuthorizationStrategy? { return nil }
    }
}
