//
//  HomeView.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    
    let store: StoreOf<HomeReducer>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack(spacing: .dx.padding12) {
                Text("Main")
               
                NavigationLink(
                  destination: IfLetStore(store.scope(state: \.profile,
                                                      action: HomeReducer.Action.profile)) {
                      ProfileView(store: $0)
                  },
                  isActive: viewStore.binding(
                    get: { $0.profile != nil },
                    send: { $0 ? .profileButtonTapped : .profileDismissed }
                  )
                ) {
                  Text("Go to profile")
                        .foregroundColor(.blue)
                }
            }
            .navigationTitle("Main")
        }
    }
}
