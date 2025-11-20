//
//  StoryProvider.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation

final class StoryProvider {

    private let repository: StoryRepository

    init(repository: StoryRepository) {
        self.repository = repository
    }

    func provideIfNeeded() {
        guard (try? repository.fetchAll())?.isEmpty ?? true else {
            debugPrint("Using existing Stories")
            return
        }

        debugPrint("Will generate new Stories")
        let mockStories = StoryFactory.generateMockStories(count: 50)
        mockStories.forEach { repository.save($0) }
    }

}
