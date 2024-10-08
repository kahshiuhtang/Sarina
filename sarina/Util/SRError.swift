//
//  SRError.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
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
