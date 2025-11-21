//
//  StoriesFeedViewModel.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation

protocol StoriesFeedViewModelProtocol {
    var hasData: Bool { get }
    var displayedStories: [Story] { get }
    var isLoading: Bool { get }

    func loadMoreIfNeeded(currentStory: Story)
}

@Observable
final class StoriesFeedViewModel: StoriesFeedViewModelProtocol {

    private let repository: StoriesRepositoryProtocol

    private(set) var displayedStories: [Story] = []
    private(set) var isLoading = false

    private var allStories: [Story] = []
    private let bufferSize: Int
    private var currentOffset = 0

    var hasData: Bool {
        allStories.count > 0
    }

    init(repository: StoriesRepositoryProtocol, bufferSize: Int = 20) {
        self.repository = repository
        self.bufferSize = bufferSize
        Task {
            await self.loadInitialStories()
        }
    }

    private func loadInitialStories() async {
        guard displayedStories.isEmpty else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            allStories = try await repository.fetchStories()
            await loadMoreStories()
        } catch {
            debugPrint("Failed to load stories: \(error)")
        }
    }

    func loadMoreIfNeeded(currentStory: Story) {
        guard currentStory.id == displayedStories.last?.id else { return }
        Task {
            debugPrint("Will load more 20 Stories")
            await loadMoreStories()
        }
    }

    private func loadMoreStories() async {
        guard !allStories.isEmpty else { return }

        let newStories: [Story] = (0..<bufferSize).compactMap { index in
            let storyIndex = (currentOffset + index) % allStories.count
            let original = allStories[storyIndex]

            return Story(
                id: original.id,
                imageURL: original.imageURL,
                isSeen: original.isSeen,
                isLiked: original.isLiked
            )
        }

        debugPrint("Buffer size = \(allStories.count)")
        displayedStories.append(contentsOf: newStories)
        currentOffset += bufferSize
    }
}
