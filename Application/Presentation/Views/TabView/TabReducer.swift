//
//  TabReducer.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import Foundation
import ComposableArchitecture

struct TabReducer: ReducerProtocol {
    
    enum Tab { case home, info, consumption, contact, settings}
    
    struct State: Equatable {
        
        // TODO: Needs research how combine reducer correctly
        var home: HomeReducer.State? = .init()
        var info: InfoReducer.State? = .init()
        var consumption: InfoReducer.State? = .init()
        var contact: InfoReducer.State? = .init()
        var settings: InfoReducer.State? = .init()
        
        var currentTab: Tab = .home
    }
    
    enum Action: Equatable {
        case home(HomeReducer.Action)
        case info(InfoReducer.Action)
        case consumption(InfoReducer.Action)
        case contact(InfoReducer.Action)
        case settings(InfoReducer.Action)
        case selectedTab(Tab)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            
            switch action {
                
            case .selectedTab(let tab):
                state.currentTab = tab
                return .none
                
            default:
                return .none
            }
        }
        .ifLet(\.home, action: /Action.home) {
            HomeReducer()
        }
    }
}
