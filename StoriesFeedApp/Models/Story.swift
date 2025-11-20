//
//  Story.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation
import SwiftData

@Model
final class Story {

    var id: UUID
    var imageURL: String
    var isSeen: Bool
    var isLiked: Bool
    var createdAt: Date

    init(id: UUID = UUID(), imageURL: String, isSeen: Bool = false, isLiked: Bool = false) {
        self.id = id
        self.imageURL = imageURL
        self.isSeen = isSeen
        self.isLiked = isLiked
        self.createdAt = Date()
    }
}
