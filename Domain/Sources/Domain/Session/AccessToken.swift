//
//  AccessToken.swift
//  Core
//
//  Created by Anton Bal` on 24.09.2022.
//

import Foundation

struct AccessToken: Codable {
    let token: String
    let refreshToken: String?
    private var expirationDate: Date?
    
    public init(token: String, refreshToken: String?, expirationDate: Date? = nil) {
        self.token = token
        self.refreshToken = refreshToken
        self.expirationDate = expirationDate
    }
}
