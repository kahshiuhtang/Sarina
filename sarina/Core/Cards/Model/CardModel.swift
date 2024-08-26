//
//  CardModel.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String {return user.id}
}
