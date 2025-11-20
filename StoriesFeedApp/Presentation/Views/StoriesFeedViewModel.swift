//
//  StoriesFeedViewModel.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation

@Observable
final class StoriesFeedViewModel {
    private(set) var displayedStories: [Story] = []
    private let allStories: [Story]
    private let bufferSize: Int
    private var currentOffset = 0

    init(stories: [Story], bufferSize: Int = 20) {
        self.allStories = stories
        self.bufferSize = bufferSize
    }

    func loadInitialStories() {
        guard displayedStories.isEmpty else { return }
        loadMoreStories()
    }

    func loadMoreIfNeeded(currentStory: Story) {
        guard currentStory.id == displayedStories.last?.id else { return }
        loadMoreStories()
    }

    private func loadMoreStories() {
        guard !allStories.isEmpty else { return }

        let newStories: [Story] = (0..<bufferSize).compactMap { index in
            let storyIndex = (currentOffset + index) % allStories.count
            let original = allStories[storyIndex]

            return Story(
                id: UUID(),
                imageURL: original.imageURL,
                isSeen: original.isSeen,
                isLiked: original.isLiked
            )
        }
        
        displayedStories.append(contentsOf: newStories)
        currentOffset += bufferSize
    }
}
