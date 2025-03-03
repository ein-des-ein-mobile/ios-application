//
//  Application.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI

struct ApplicationView: View {
    var body: some View {
        TabView {
            RouterView(initial: AppFlow.home)
                .tabItem {
                    Label("Home", systemImage: "list.dash")
                }

            RouterView(initial: AppFlow.settings)
                .tabItem {
                    Label("Settings", systemImage: "square.and.pencil")
                }
        }
    }
}
