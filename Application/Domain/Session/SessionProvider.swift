//
//  SessionProvider.swift
//  Application
//
//  Created by Anton Bal` on 20.11.2022.
//

import Core

public protocol SessionProvider {
    associatedtype AUser: AuthUser

    func get() -> Session<AUser>?
    func refreshToken() async throws
    func save(session: Session<AUser>) throws
    func delete() throws
}
