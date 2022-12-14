//
//  AuthorizationPlugin.swift
//

import Foundation
import Combine
import Core

public final class AuthorizationPlugin<AUser, Session: SessionProvider>: NetworkPlugin
            where AUser == Session.AUser {

    public var sessionProvider: Session?

    public func prepare(_ request: URLRequest, target: RequestConvertible) throws -> URLRequest {
        var request = request
        guard target.authorizationStrategy == .token else { return request}
        guard let accessToken = sessionProvider?.get()?.accessToken else { throw APIError.sessionRequired }
        request.add(header: .authorization(bearerToken: accessToken.token))
        return request
    }
    
    public func should(retry target: RequestConvertible, dueTo error: Error) async throws -> Bool {
        guard target.authorizationStrategy == .token else { return false }

        guard let session = sessionProvider else {
            return false
        }

        if let responseError = error as? APIError, responseError.statusCode == 401 {
            try await session.refreshToken()
            return true
        } else {
            return false
        }
    }
}
