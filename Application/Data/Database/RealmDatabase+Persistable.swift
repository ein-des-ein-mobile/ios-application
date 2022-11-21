//
//  RealmDatabase+Persistable.swift
//  Application
//
//  Created by Anton Bal` on 21.11.2022.
//


import RealmSwift
import Core

// MARK: - Realm Persistable Mappers

extension Persistable {
    func persist<D>(to database: D) async throws -> ManagedObject
    where D: DatabaseProvider,
          ManagedObject: RealmSwift.Object,
          Context == Void {
              try await database.persist(self)
          }
    
}

extension PersistableCollection {
    func persist<D>(to database: D) async throws -> [Item.ManagedObject]
    where D: DatabaseProvider,
          Item.ManagedObject: RealmSwift.Object,
          Item.Context == Void
    {
        try await database.persist(self)
    }
}

extension RealmSwift.Object {
    func tryMap<T, D>(to type: T.Type, database: D) async throws -> T?
    where D: DatabaseProvider,
          T: DatabaseRepresentable,
          T.ManagedObject: RealmSwift.Object,
          T.Context == Void
    {
        try await database.perform { [unowned self] _ -> T? in
            guard !self.isInvalidated else {
                return nil
            }
            return try T(self as! T.ManagedObject)
        }
    }
}

extension Array where Element: RealmSwift.Object {
    func tryMap<T, D>(to type: T.Type, database: D) async throws -> [T]
    where D: DatabaseProvider,
          T: DatabaseRepresentable,
          T.ManagedObject: RealmSwift.Object,
          T.Context == Void
    {
        try await database.perform { _ -> [T] in
            try self.compactMap {
                guard !$0.isInvalidated else {
                    return nil
                }
                return try T($0 as! T.ManagedObject)
            }
        }
    }
}
