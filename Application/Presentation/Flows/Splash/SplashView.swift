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
        WithViewStore(store) { viewState in
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

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(
            store: Store(
                initialState: SplashReducer.State(),
                reducer: SplashReducer()
            )
        )
    }
}
