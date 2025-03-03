//
//  RouterView.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI
import Domain

struct RouterView<Route: Routable>: View {
    @StateObject private var router = Router<Route>()
    @Environment(\.context) var context: ServiceContext
    
    let initial: Route
    
    var body: some View {
        NavigationStack(path: $router.path) {
            initial.makeView(context: context)
                .navigationDestination(for: Route.self) {
                    $0.makeView(context: context)
                }
        }
        .environmentObject(router)
    }
}
