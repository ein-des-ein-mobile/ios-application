//
//  Router.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI

@MainActor
final class Router<Route: Routable>: ObservableObject {
    // MARK: - Public properties

    @Published var path = NavigationPath()

    func push(_ appRoute: Route) {
        path.append(appRoute)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
