//
//  ApplicationApp.swift
//  Application
//
//  Created by Anton Bal` on 14.11.2022.
//

import SwiftUI
import ComposableArchitecture

@main
struct ApplicationApp: App {
    let store = Store(
      initialState: RootReducer.State(),
      reducer: RootReducer()._printChanges()
    )
    
    var body: some Scene {
        WindowGroup {
            RootView(store: store)
        }
    }
}
