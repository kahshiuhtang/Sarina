//
//  MockData.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "The Rock",
            age: 37,
            profileImageURLs: [
                "therock",
                "therock1",
                "therock2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "David Beckham",
            age: 51,
            profileImageURLs: [
                "db1",
                "db2"
            ]
        ),.init(
            id: NSUUID().uuidString,
            fullName: "Conor McGregor",
            age: 35,
            profileImageURLs: [
                "cm2",
            ]
        )]
}
