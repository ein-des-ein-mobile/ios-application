//
//  HomeViewModel.swift
//  Template
//
//  Created by Anton Bal’ on 02.03.2025.
//

import Foundation
import Domain
import SwiftUICore

extension HomeView {
    final class ViewModel: ObservableObject {
        let session: any SessionUseCase
        
        init(session: any SessionUseCase) {
            self.session = session
        }
    }
}
