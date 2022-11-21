//
//  ProfileView.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import SwiftUI
import ComposableArchitecture

struct ProfileView: View {
    
    let store: StoreOf<ProfileReducer>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            
            HStack {
                Spacer()
                
                VStack(alignment: .center, spacing: .dx.padding40) {
                    Spacer()
                    
                    Text("Profile")
                    
                    Button("Log out") {
                        viewStore.send(.logout)
                    }
                    .disabled(viewStore.isLogoutInPropgress)
                    Spacer()
                }
                
                Spacer()
            }
            .navigationTitle("Profile")
            .loaderSheet(isPresented: .constant(viewStore.isLogoutInPropgress))
            .alert(store.scope(state: \.alert), dismiss: .alertDismissed)
        }
    }
}
