//
//  RMUser.swift
//  Template
//
//  Created by Anton Bal` on 31.10.2022.
//

import Foundation
import RealmSwift

@objcMembers
final class RMUser: Object, Identifiable {
    override static func primaryKey() -> String? { "id" }
    
    @Persisted var id: String = ""
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted var dateOfBirth: Date = Date.now

}
