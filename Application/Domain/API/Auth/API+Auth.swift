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
        case signOut

        var path: String {
            switch self {
            case .signIn:
                return "auth/login"
            case .signOut:
                return "auth/logout"
            }
        }

        var method: HTTPMethod {
            switch self {
            case .signIn:
                return .post
            case .signOut:
                return .delete
            }
        }

        var task: NetworkTask {
            switch self {
            case .signIn(let params):
                return .requestParameters(parameters: params.builder.make())
            case .signOut:
                return .requestPlain
            }
        }

        var authorizationStrategy: AuthorizationStrategy? { return nil }
    }
}
