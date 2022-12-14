//
//  AccessToken.swift
//  Core
//
//  Created by Anton Bal` on 24.09.2022.
//

import Foundation
import Core

public final class AccessToken: Codable {
    enum CodingKeys: String, CodingKey {
        case token
        case refreshToken
        case expirationDate = "expiresAt"
    }

    let token: String
    let refreshToken: String?
    private var expirationDate: Date?

    public var isValid: Bool {
        if let date = expirationDate {
            return  date > Date()
        }
        return true
    }

    public func invalidate() {
        if expirationDate != nil {
            expirationDate = Date()
        }
    }
    
    public init(token: String, refreshToken: String?, expirationDate: Date?) {
        self.token = token
        self.refreshToken = refreshToken
        self.expirationDate = expirationDate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        token = try container.decode(String.self, forKey: .token)
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken)
        let dateString = try container.decodeIfPresent(String.self, forKey: .expirationDate)
        expirationDate = ISO8601DateFormatter().date(from: dateString ?? "") ?? nil
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(token, forKey: .token)
        try container.encode(refreshToken, forKey: .refreshToken)
        
        if let date = expirationDate {
            try container.encode(ISO8601DateFormatter().string(from: date), forKey: .expirationDate)
        }
    }
}

// MARK: - Faking

extension AccessToken: Faking {
    public convenience init() {
        self.init(token: "1", refreshToken: nil, expirationDate: nil)
    }
}
