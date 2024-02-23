//
//  LoginReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture
import Core

@Reducer
struct LoginReducer {
   
    @ObservableState
    struct State: Equatable {
        var user: User?
        
        var email = "app@core.com"
        var password = "123"
        var isFormValid = false
        var isLoginInPropgress = false
        
        init() {}
        
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action: Equatable {
        enum Alert: Equatable {}
        
        case signIn
        case signInResponse(TaskResult<User>)
        case emailChanged(String)
        case passwordChanged(String)
        case alert(PresentationAction<Alert>)
    }
    
    @Dependency(\.sessionUseCase) var authUseCase
    
    public var body: some Reducer<State, Action> {
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
                return .run { [email = state.email, password = state.password] send in
                    await send(.signInResponse(
                        TaskResult { try await self.authUseCase.signIn(with: email, password: password).user }
                    ))
                }
                
            case let .signInResponse(.success(user)):
                state.isLoginInPropgress = false
                state.user = user
                return .none
                
            case let .signInResponse(.failure(error)):
                state.isLoginInPropgress = false
                state.alert = AlertState(title: TextState(error.localizedDescription))
                return .none
                
            case .alert(.dismiss):
                state.alert = nil
                return .none
            }
        }
    }
}
