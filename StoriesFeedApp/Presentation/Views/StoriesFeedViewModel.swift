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
        let newStories = Array(allStories.prefix(bufferSize))
        displayedStories.append(contentsOf: newStories)
    }
}
