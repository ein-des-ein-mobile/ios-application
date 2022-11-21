//
//  SessionUseCase.swift
//
//  Created by Anton Bal` on 24.09.2022.
//

import Combine
import Core

protocol SessionUseCase: SessionProvider where AUser == User {
    func signIn(with username: String, password: String) async throws -> Session<User>
    func signOut() async throws
}
