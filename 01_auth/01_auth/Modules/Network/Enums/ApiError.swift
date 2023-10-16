//
//  ApiError.swift
//  01_auth
//
//  Created by Vladlen on 15.10.2023.
//

enum ApiError: Error {
    case wrongRequest
    case parsingError
    case unauthorized
    case notResults
    case serverError(code: Int)
    case unknown
}
