//
//  MockPlatform.swift
//  Application
//
//  Created by Anton Bal` on 13.11.2022.
//

import Foundation
import Core

final class MockPlatform: UseCaseProvider {
    let sessionUseCase: any SessionUseCase = MockSessionService()
}
