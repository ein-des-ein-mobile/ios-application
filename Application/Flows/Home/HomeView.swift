//
//  HomeView.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI
import Domain

struct HomeView: View {
    @EnvironmentObject private var router: Router<AppFlow>
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hello, Home! \(viewModel.session.get()?.user.id)")
            
            Button(action: {
                router.push(.settings)
            }) {
                Text("Settings")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: .init(session: MockSessionUseCase()))
}
