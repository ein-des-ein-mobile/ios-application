//
//  RealmDatabase.swift
//
//  Created by Anton Bal` on 30.09.2022.
//

import RealmSwift
import Core

extension Realm: Database {
    
    public func fetchOrCreate<T, Key>(_ type: T.Type, forPrimaryKey key: Key?) throws -> T.ManagedObject where T : Persistable {
        guard let RealmObject = type.ManagedObject as? Object.Type else {
            throw DatabaseError.typeCasting(type)
        }
        
        guard let primaryKey = RealmObject.primaryKey(), let key = key else {
            return RealmObject.init() as! T.ManagedObject
        }
        
        return create(RealmObject, value: [primaryKey: key], update: .all) as! T.ManagedObject
    }
}

final class RealmDatabase: DatabaseProvider {
    
    typealias DB = Realm
    
    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(
            schemaVersion: 1,
            deleteRealmIfMigrationNeeded: true
        )
    }
    
    func perform<Output>(_ action: @escaping (RealmSwift.Realm) async throws -> Output) async throws -> Output {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            self?.performWrite(action) {
                continuation.resume(with: $0)
            }
        }
    }
    
    func erase() async throws  {
        try await withCheckedThrowingContinuation { [weak self] continuation in
            self?.performWrite({
                $0.deleteAll()
            }){
                continuation.resume(with: $0)
            }
            
        }
    }
    
    private func performWrite<Output>( _ action: @escaping (DB) async throws -> Output,
                                       result: @escaping (Result<Output, Error>) -> Void) {
        Task.detached(priority: .medium) {
            do {
                let realm = try await Realm()
                let wasInWriteTransaction = realm.isInWriteTransaction
                if !wasInWriteTransaction {
                    realm.beginWrite()
                }
                let output = try await action(realm)
                if !wasInWriteTransaction {
                    try realm.commitWrite()
                }
                result(.success(output))
            } catch {
                result(.failure(error))
            }
        }
    }
}
