//
//  RootReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import ComposableArchitecture

@Reducer
struct RootReducer {
    enum State: Equatable {
        case login(LoginReducer.State)
        case home(TabReducer.State)
        case splash(SplashReducer.State)
        
        init() { self = .splash(.init()) }
    }
    
    enum Action: Equatable {
        case login(LoginReducer.Action)
        case home(TabReducer.Action)
        case splash(SplashReducer.Action)
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in

            switch action {
                
            case .login(.signInResponse(.success)):
                state = .home(.init())
                
            case .home(.home(.profile(.presented(.logoutResponse(.success))))):
                state = .login(.init())
                
            case .splash(.authorized(let user)):
                
                if user != nil {
                    state = .home(.init())
                } else {
                    state = .login(.init())
                }
                
                return .none
            case .login:
                return .none
                
            case .splash:
                return .none
                
            case .home:
                return .none
            }
            
            return .none
        }
        .ifCaseLet(/State.login, action: /Action.login) {
            LoginReducer()
        }
        .ifCaseLet(/State.home, action: /Action.home) {
            TabReducer()
        }
        .ifCaseLet(/State.splash, action: /Action.splash) {
            SplashReducer()
        }
    }
}
