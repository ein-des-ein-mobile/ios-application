//
//  SessionUseCase.swift
//  Domain
//
//  Created by Anton Bal’ on 02.03.2025.
//

public protocol SessionUseCase: SessionProvider where AUser == User {
    func signIn(with username: String, password: String) async throws -> Session<User>
    func restorePassword(with email: String) async throws
    func signOut() async throws
}
