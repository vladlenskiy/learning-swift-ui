//
//  User.swift
//  01_auth
//
//  Created by Vladlen on 15.10.2023.
//

import Foundation
import SwiftUI

struct User: Decodable, Identifiable, Hashable {
    var id: Int
    var fullName: String
    var isUser: Bool
    var rating: String
}

struct UsersModel {
    func getUsers() async throws -> [User] {
        return try await self.request()
    }
    
    func request() async throws -> [User] {
        return try await UsersResource().loadUsers().get();
    }
}

class UsersResource: BaseApi {
    private enum Constants {
        static let resourceUrl = "data"
    }
    
    private var url = URL(string: BaseApi.Constants.baseUrl + Constants.resourceUrl)
    
    func loadUsers() async -> Result<[User], ApiError> {
        return await self.sendRequest(url: url, responseModel: [User].self)
    }
}
