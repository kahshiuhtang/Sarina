//
//  CardService.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({CardModel(user: $0)})
    }
}

