//
//  Task.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
//

import Foundation

struct UserTask: Decodable, Identifiable{
    let id: UInt64
    let title: String
    let rarity: String
    let description: String
    let issuedDate: Date
    let createdDate: Date
}

struct UserTasksResponse : Decodable{
    let request: [UserTask]
}
struct MockUserTasksData {
    static let sampleUserTask1 = UserTask(id: 001, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let sampleUserTask2 = UserTask(id: 002, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let sampleUserTask3 = UserTask(id: 003, title: "task 1", rarity: "rare", description: "task",  issuedDate: Date(), createdDate: Date())
    static let userTasks = [sampleUserTask1, sampleUserTask2, sampleUserTask3]
}
