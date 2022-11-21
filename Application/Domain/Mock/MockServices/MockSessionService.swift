//
//  MockSessionService.swift
//  Application
//
//  Created by Anton Bal` on 20.11.2022.
//

import Foundation
import Core

final class MockSessionService: SessionUseCase {
    private var session: Session<User>? = Session(user: User.fakeItem(), accessToken: AccessToken.fakeItem())
    
    func signIn(with username: String, password: String) async throws -> Session<User> {
        try await delayed {
            let session = Session(user: User.fakeItem(), accessToken: AccessToken.fakeItem())
            try save(session: session)
            return session
        }
    }
    
    func signOut() async throws {
        try await delayed {
            try delete()
        }
    }
    
    func get() -> Session<User>? {
        session
    }
    
    func refreshToken() async throws {
        
    }
    
    func save(session: Session<User>) throws {
        self.session = session
    }
    
    func delete() throws {
        session = nil
    }
}
