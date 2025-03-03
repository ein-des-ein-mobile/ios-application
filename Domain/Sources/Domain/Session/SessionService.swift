//
//  SessionService.swift
//
//  Created by Anton Bal` on 29.09.2022.
//

import Foundation
import Core

public final class SessionService {
    
    enum SecureStorageKey: String {
        case accessToken
    }
 
    private let context: ServiceContext
    
    @StorageWrapper(key: SecureStorageKey.accessToken.rawValue, defaultValue: nil, storage: KeychainStorage())
    private var session: Session<User>?

    public init(context: ServiceContext) {
        self.context = context
    }
}


// MARK: - SessionUseCase

extension SessionService: SessionUseCase {
    
    public func signIn(with username: String, password: String) async throws -> Session<User> {
        let token =  try await context.networking.data(
                for: API.Auth.signIn(
                    .init(
                        username: username,
                        password: password
                    )
                )
            )
            .jsonDecode(to: AccessToken.self)
        
        
        let session = Session(user: User(id: 0), accessToken: token)
        try save(session: session)
        return session
    }
    
    public func restorePassword(with email: String) async throws {
        try await context
            .networking
            .data(for: API.Auth.restorePassword(.init(email: email)))
    }
    
    public func signOut() async throws {
        try await context.networking.data(for: API.Auth.signOut)
        
        try await delete()
    }

    public func get() -> Session<User>? { session }

    public func save(session: Session<User>) throws {
        try context.secureStorage.save(
            session.accessToken,
            key: SecureStorageKey.accessToken.rawValue
        )

        self.session = session
    }

    public func delete() async throws {
        session = nil
    }

    public func refreshToken() async throws  {
        try await delete()
    }
}
