//
//  NetworkManager.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 9/13/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
    case decoding(Error?)
    case serverError
}
typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void
