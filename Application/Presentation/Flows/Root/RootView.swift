//
//  RootView.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
  
  let store: StoreOf<RootReducer>
  
  init(store: StoreOf<RootReducer>) {
    self.store = store
  }
  
  public var body: some View {
    SwitchStore(store) { state in
      switch state {
      case .splash:
        CaseLet(/RootReducer.State.splash, action: RootReducer.Action.splash) { store in
          SplashView(store: store)
        }
      case .login:
        CaseLet(/RootReducer.State.login, action: RootReducer.Action.login) { store in
          NavigationView {
            LoginView(store: store)
          }
          .navigationViewStyle(.stack)
        }
      case .home:
        CaseLet(/RootReducer.State.home, action: RootReducer.Action.home) { store in
          NavigationView {
            TabView(store: store)
          }
          .navigationViewStyle(.stack)
        }
      }
    }
  }
}

#Preview {
  RootView(
    store: Store(initialState: RootReducer.State()){
      RootReducer()
    }
  )
}

