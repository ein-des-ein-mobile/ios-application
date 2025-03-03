//
//  SettingsView.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var router: Router<AppFlow>
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Hello, Settings!")
            
            Button(action: {
                router.pop()
            }) {
                Text("Back")
            }
        }
    }
}
