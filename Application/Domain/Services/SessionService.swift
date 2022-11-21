//
//  SessionService.swift
//
//  Created by Anton Bal` on 29.09.2022.
//

import Foundation
import Core

final class SessionSerivce {

    private enum SecureStorageKey: String {
        case accessToken
    }
    
    private enum SignInError: LocalizedError {
        case usernamePasswordWrong
        case api(APIError)

        init(_ api: APIError) {
            if case let .statusCode(code) = api, code == 401 {
                self = .usernamePasswordWrong
            } else {
                self = .api(api)
            }
        }
    }

    private let context: ServiceContext
    private var session: Session<User>?

    init(context: ServiceContext) {
        self.context = context
    }
}

// MARK: - SessionUseCase

extension SessionSerivce: SessionUseCase {
    
    func signIn(with username: String, password: String) async throws -> Session<User> {
        let session = try await context
            .networking
            .data(for: API.Auth.signIn(SignInParams(username: username, password: password)))
            .jsonDecode(to: Session<User>.self)
       
        try save(session: session)
        return session
    }
    
    func signOut() async throws {
        _ = try await context
            .networking
            .data(for: API.Auth.signOut)
        
        try await context.database.erase()
        try delete()
    }

    func get() -> Session<User>? { session }

    func save(session: Session<User>) throws {
        try context.secureStorage.save(session.accessToken,
                                       key: SecureStorageKey.accessToken.rawValue)
        self.session = session
    }

    func delete() throws {
        try context.secureStorage.remove(key: SecureStorageKey.accessToken.rawValue)
        session = nil
    }

    func refreshToken() async throws  {
        throw APIError.notImplemented(SessionSerivce.self)
    }
}


