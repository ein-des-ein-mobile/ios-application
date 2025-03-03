//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Anton Bal’ on 03.03.2025.
//

import Foundation
import SwiftUICore

public protocol UseCaseProviderProtocol {
    var session: any SessionUseCase { get set }
}

public struct MockUseCaseProvider: UseCaseProviderProtocol {
    public var session: any SessionUseCase = MockSessionUseCase()
}

public struct UseCaseProvider: UseCaseProviderProtocol {
    public var session: any SessionUseCase
    
    public init(context: ServiceContext) {
        session = SessionService(context: context)
    }
}

//
//private struct UseCaseProviderEnvironmentKey: EnvironmentKey {
//    public static var defaultValue: UseCaseProviderProtocol { MockUseCaseProvider() }
//}
//
//extension EnvironmentValues {
//    public var useCases: UseCaseProviderProtocol {
//        get { self[UseCaseProviderEnvironmentKey.self] }
//        set { self[UseCaseProviderEnvironmentKey.self] = newValue }
//    }
//}
