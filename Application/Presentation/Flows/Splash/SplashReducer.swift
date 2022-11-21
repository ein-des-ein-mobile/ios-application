//
//  SplashReducer.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import ComposableArchitecture
import Core

struct SplashReducer: ReducerProtocol {
   
    struct State: Equatable {
        var inProgress: Bool = true
    }
    
    enum Action: Equatable {
        case onApear
        case authorized(user: User?)
    }
    
    @Dependency(\.sessionUseCase) var sessionUseCase
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
                
            case .onApear:
                return .task { .authorized(user: sessionUseCase.get()?.user)  }
                
            case .authorized:
                state.inProgress = false
                return .none
            }
        }
    }
}
