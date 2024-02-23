//
//  User.swift
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import Core

struct User: AuthUser, Identifiable, Equatable {
    let id: String_ID<Self>
    let firstName: String
    let lastName: String
    let dateOfBirth: Date?
}

// MARK: - DatabaseRepresentable

extension User: DatabaseRepresentable {
    
    init(_ object: UserCD) throws {
        self.init(id: .init(value: object.id ?? ""),
                  firstName: object.firstName ?? "",
                  lastName: object.lastName ?? "",
                  dateOfBirth: object.dateOfBirth
        )
    }
}

// MARK: - Faking

extension User: Faking {
    init() {
        id = .init(value: UUID().uuidString)
        firstName = "firstName"
        lastName = "lastName"
        dateOfBirth = .now
    }
}
