
//
//  SessionUseCase.swift
//  Domain
//
//  Created by Anton Bal’ on 02.03.2025.
//

final public class MockSessionUseCase: SessionUseCase {
    
    public init() { }
    
    public func get() -> Session<User>? {
        Session<User>(user: .init(id: 9999), accessToken: .init(token: "token", refreshToken: "refreshToken"))
    }
    
    public func refreshToken() async throws {
        
    }
    
    public func save(session: Session<User>) throws {
        
    }
    
    public func delete() async throws {
        
    }
    
    public func signIn(with username: String, password: String) async throws -> Session<User> {
        Session<User>.init(user: .init(id: 1), accessToken: .init(token: "", refreshToken: "", expirationDate: nil))
    }
    
    public func restorePassword(with email: String) async throws {
        
    }
    
    public func signOut() async throws {
        
    }
}
