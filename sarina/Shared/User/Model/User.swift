//
//  User.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}
