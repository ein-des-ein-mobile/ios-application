//
//  ProfileReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture

struct ProfileReducer: ReducerProtocol {
    
    struct State: Equatable {
        var isLogoutInPropgress = false
        var alert: AlertState<Action>?
    }
    
    enum Action: Equatable {
        case logout
        case logoutResponse(TaskResult<Bool>)
        case alertDismissed
    }
    
    @Dependency(\.sessionUseCase) var authUseCase
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .logout:
                state.isLogoutInPropgress = true
                return .task {
                    await .logoutResponse(
                        TaskResult {
                            try await self.authUseCase.signOut()
                            return true
                        }
                    )
                }
            case .logoutResponse(.success):
                state.isLogoutInPropgress = false
                return .none
                
            case let .logoutResponse(.failure(error)):
                state.isLogoutInPropgress = false
                state.alert = AlertState(title: TextState(error.localizedDescription))
                return .none
                
            case .alertDismissed:
              state.alert = nil
              return .none
            }
        }
    }
}
