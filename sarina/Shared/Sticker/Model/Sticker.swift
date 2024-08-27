//
//  Sticker.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 8/26/24.
//

import Foundation

struct Sticker: Decodable{
    let id: UInt64
    let title: String
    let rarity: String
    let description: String
    let imageUrl: String
    let parentSetName: String
    let createdDate: Date
}
struct StickerResponse{
    let request: [Sticker]
}
struct MockStickerData {
    static let sampleSticker = Sticker(id: 001, title: "sticker 1", rarity: "rare", description: "sticker", imageUrl: "https://google.com", parentSetName: "cities", createdDate: Date())
    static let stickers = [sampleSticker, sampleSticker, sampleSticker]
}
