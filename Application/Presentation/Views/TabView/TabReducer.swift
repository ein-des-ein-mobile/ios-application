//
//  TabReducer.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TabReducer {
    
    enum Tab { case home, info, consumption, contact, settings}
    
    @ObservableState
    struct State: Equatable {
        
        var home = HomeReducer.State()
        var info = InfoReducer.State()
        var consumption = InfoReducer.State()
        var contact = InfoReducer.State()
        var settings = InfoReducer.State()
        
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
    
    var body: some Reducer<State, Action> {
        Scope(state: \.home, action: /Action.home) {
            HomeReducer()
        }
        Scope(state: \.info, action: /Action.info) {
            InfoReducer()
        }
        Scope(state: \.consumption, action: /Action.consumption) {
            InfoReducer()
        }
        Scope(state: \.contact, action: /Action.contact) {
            InfoReducer()
        }
        Scope(state: \.settings, action: /Action.settings) {
            InfoReducer()
        }
        Reduce { state, action in
            
            switch action {
                
            case .selectedTab(let tab):
                state.currentTab = tab
                return .none
                
            default:
                return .none
            }
        }
    }
}
