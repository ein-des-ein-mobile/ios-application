//
//  AppEnvironment.swift
//
//  Created by Anton Bal` on 25.09.2022.
//

import Foundation
import Core

protocol ApplicationEnvironment: NetworkEnvironment {
    var isDebug: Bool { get }
}

enum AppEnvironment: ApplicationEnvironment {
    
    case develop
    case production
    
    #if DEVELOPMENT
    static let current: AppEnvironment = .develop
    #else
    static let current: AppEnvironment = .production
    #endif

    var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    var baseURL: URL {
        let baseURLString: String = {
            switch self {
            case .develop: return "https://"
            case .production: return "https://"
            }
        }()
        return URL(string: baseURLString)!
    }
}
