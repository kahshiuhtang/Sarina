//
//  Task.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
//

import Foundation

struct UserTasks: Decodable, Identifiable{
    let id: UInt64
    let title: String
    let rarity: String
    let description: String
    let issuedDate: Date
    let createdDate: Date
}

struct UserTasksResponse{
    let request: [UserTasks]
}
struct MockUserTasksData {
    static let sampleUserTask1 = UserTasks(id: 001, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let sampleUserTask2 = UserTasks(id: 002, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let sampleUserTask3 = UserTasks(id: 003, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let userTasks = [sampleUserTask1, sampleUserTask2, sampleUserTask3]
}
