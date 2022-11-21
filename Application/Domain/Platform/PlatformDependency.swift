//
//  DependencyValues.swift
//  Template
//
//  Created by Anton Bal` on 10.11.2022.
//

import Foundation
import ComposableArchitecture
import Core

extension DependencyValues: UseCaseProvider {
    private var useCaseProvider: UseCaseProvider {
        get { self[Platform.self] }
        set { self[Platform.self] = newValue }
    }
    
    var sessionUseCase: any SessionUseCase  {
        useCaseProvider.sessionUseCase
    }
}

extension Platform: DependencyKey {
    static var liveValue: UseCaseProvider {
        Platform(environment: AppEnvironment.current)
    }
    
    static var previewValue: UseCaseProvider {
        MockPlatform()
    }
}

extension Platform: TestDependencyKey {
    static var testValue: UseCaseProvider {
        MockPlatform()
    }
}
