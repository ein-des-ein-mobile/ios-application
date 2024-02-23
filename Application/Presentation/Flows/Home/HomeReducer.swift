//
//  HomeReducer.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import ComposableArchitecture

@Reducer
struct HomeReducer {
    
    @ObservableState
    struct State: Equatable {
        @Presents var profile: ProfileReducer.State?
    }
    
    enum Action: Equatable {
        case profileDismissed
        case profileButtonTapped
        case profile(PresentationAction<ProfileReducer.Action>)
    }
    
    var body: some Reducer<State, Action> {
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
        .ifLet(\.$profile, action: /HomeReducer.Action.profile) {
            ProfileReducer()
        }
    }
}
