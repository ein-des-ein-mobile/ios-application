//
//  User+Response.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import Core

extension User {
    struct Response: Decodable, Identifiable {
        let id: String
        let dateOfBirth: ShortDateCoder
        let firstName: String
        let lastName: String
    }
}

// MARK: - Persistable

extension User.Response: Persistable {

    typealias ManagedObject = RMUser
    typealias Context = Void

    func update(_ object: RMUser, context: Void) throws {
        object.dateOfBirth = dateOfBirth.value
        object.firstName = firstName
        object.lastName = lastName
    }
}
