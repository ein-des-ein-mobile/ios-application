//
//  LoginReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture
import Core

struct LoginReducer: ReducerProtocol {
   
    struct State: Equatable {
        var user: User?
        var alert: AlertState<Action>?
        var email = "app@core.com"
        var password = "123"
        var isFormValid = false
        var isLoginInPropgress = false
        
        init() {}
    }
    
    enum Action: Equatable {
        case signIn
        case signInResponse(TaskResult<User>)
        case alertDismissed
        case emailChanged(String)
        case passwordChanged(String)
    }
    
    @Dependency(\.sessionUseCase) var authUseCase
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case let .emailChanged(email):
                state.email = email
                state.isFormValid = !state.email.isEmpty && !state.password.isEmpty
                return .none
                
            case let .passwordChanged(password):
                state.password = password
                state.isFormValid = !state.email.isEmpty && !state.password.isEmpty
                return .none
                
            case .signIn:
                state.isLoginInPropgress = true
                return .task { [email = state.email, password = state.password] in
                    await .signInResponse(
                        TaskResult { try await self.authUseCase.signIn(with: email, password: password).user }
                    )
                }
                
            case let .signInResponse(.success(user)):
                state.isLoginInPropgress = false
                state.user = user
                return .none
                
            case let .signInResponse(.failure(error)):
                state.isLoginInPropgress = false
                state.alert = AlertState(title: TextState(error.localizedDescription))
                return .none
                
            case .alertDismissed:
                state.alert = nil
                return .none
            }
        }
    }
}
