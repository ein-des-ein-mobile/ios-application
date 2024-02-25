//
//  SplashView.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
  let store: StoreOf<SplashReducer>
  
  var body: some View {
    WithViewStore(store, observe: { $0 }) { viewState in
      VStack {
        EmptyView()
      }
      .loader(isPresented: .constant(viewState.state.inProgress))
      .onAppear {
        viewState.send(.onApear)
      }
    }
  }
}

#Preview {
  SplashView(
    store: Store(initialState: SplashReducer.State()) {
      SplashReducer()
    }
  )
}
