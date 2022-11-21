//
//  HomeReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture

struct HomeReducer: ReducerProtocol {
    
    struct State: Equatable {
        var profile: ProfileReducer.State?
    }
    
    enum Action: Equatable {
        case profileDismissed
        case profileButtonTapped
        case profile(ProfileReducer.Action)
    }
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .profileButtonTapped:
                state.profile = .init()
                return .none
            case .profileDismissed:
                state.profile = nil
                return .none
            case .profile:
              return .none
            }
        }
        .ifLet(\.profile, action: /HomeReducer.Action.profile) {
            ProfileReducer()
        }
    }
}
