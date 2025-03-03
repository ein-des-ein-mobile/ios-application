//
//  AppFlow.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import SwiftUI
import Domain

enum AppFlow {
    case home
    case settings
}

extension AppFlow: ViewFactory {
    func makeView(context: ServiceContext) -> some View {
        return Group {
            switch self {
            case .home:
                HomeView(viewModel: .init(session: SessionService(context: context)))
            case .settings:
                SettingsView(viewModel: .init())
            }
        }
    }
}
