//
//  ProfileReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture

@Reducer
struct ProfileReducer {
    
    @ObservableState
    struct State: Equatable {
        var isLogoutInPropgress = false
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action: Equatable {
        enum Alert: Equatable {
            
        }
        
        case logout
        case logoutResponse(TaskResult<Bool>)
        case alert(PresentationAction<Alert>)
    }
    
    @Dependency(\.sessionUseCase) var authUseCase
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .logout:
                state.isLogoutInPropgress = true
                return .run { send in
                    await send(.logoutResponse(
                        TaskResult {
                            try await self.authUseCase.signOut()
                            return true
                        }
                    ))
                }
            case .logoutResponse(.success):
                state.isLogoutInPropgress = false
                return .none
                
            case let .logoutResponse(.failure(error)):
                state.isLogoutInPropgress = false
                state.alert = AlertState(title: TextState(error.localizedDescription))
                return .none
                
            case .alert(.dismiss):
              state.alert = nil
              return .none
            }
        }
    }
}
