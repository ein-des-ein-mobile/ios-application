//
//  LoginView.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import SwiftUI
import ComposableArchitecture

struct LoginView: View {
    
    private enum Field: Hashable {
        case usernameField
        case passwordField
    }
    
    private struct ViewState: Equatable, Hashable {
        let email: String
        let password: String
        let isLoginInPropgress: Bool
        let isFormValid: Bool
        
        init(state: LoginReducer.State) {
            email = state.email
            password = state.password
            isLoginInPropgress = state.isLoginInPropgress
            isFormValid = state.isFormValid
        }
    }
    
    let store: StoreOf<LoginReducer>
    
    @ObservedObject private var viewStore: ViewStore<ViewState, LoginReducer.Action>
    @FocusState private var focusedField: Field?
    
    init(store: StoreOf<LoginReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: ViewState.init)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .dx.padding20) {
            
            Spacer()
            
            VStack(alignment: .leading, spacing: .dx.padding4){
                Text(R.string.localizable.auth_username())
                    .foregroundColor(.black)
                
                TextField(R.string.localizable.auth_email(),
                          text: viewStore.binding(get: \.email,
                                                  send: LoginReducer.Action.emailChanged))
                .focused($focusedField, equals: .usernameField)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .passwordField
                }
            }
            
            VStack(alignment: .leading, spacing: .dx.padding4){
                Text(R.string.localizable.auth_password())
                    .foregroundColor(.black)
                
                SecureField(R.string.localizable.auth_password(),
                            text: viewStore.binding(get: \.password,
                                                    send: LoginReducer.Action.passwordChanged))
                .focused($focusedField, equals: .passwordField)
                .submitLabel(.done)
            }
            .padding(.bottom, .dx.padding20)
            
            Button(action: {
                viewStore.send(.signIn)
            }) {
                Text(R.string.localizable.auth_login())
            }
            .buttonStyle(.fill)
            .disabled(viewStore.isLoginInPropgress)
            .disabled(!viewStore.isFormValid)
        }
        .padding()
        .navigationTitle(R.string.localizable.auth_login())
        .loaderSheet(isPresented: .constant(viewStore.isLoginInPropgress))
        .alert(store.scope(state: \.alert), dismiss: .alertDismissed)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(
            store: Store(
                initialState: LoginReducer.State(),
                reducer: LoginReducer()
            )
        )
    }
}
