//
//  StoryFactory.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation

struct StoryFactory {
    static func generateMockStories(count: Int) -> [Story] {
        (1...count).map { index in
            Story(
                id: UUID(),
                imageURL: "https://picsum.photos/1080/1920?random=\(index)",
                isSeen: false,
                isLiked: false
            )
        }
    }
}
