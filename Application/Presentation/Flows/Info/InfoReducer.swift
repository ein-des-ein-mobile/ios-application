//
//  InfoReducer.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import ComposableArchitecture
import Core

struct InfoReducer: ReducerProtocol {
   
    struct State: Equatable {
        var alert: AlertState<Action>?
    }
    
    enum Action: Equatable {
        case alertDismissed
    }

    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .alertDismissed:
                state.alert = nil
                return .none
            }
        }
    }
}
