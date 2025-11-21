//
//  StoriesRepository.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 21/11/2025.
//

import Foundation
import SwiftData

protocol StoriesRepositoryProtocol {
    func fetchStories() async throws -> [Story]
}

final class StoriesRepository: StoriesRepositoryProtocol {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchStories() async throws -> [Story] {
        let descriptor = FetchDescriptor<Story>(
            // Remove responsability of sorting from Presentation Layer (View)
            sortBy: [SortDescriptor(\Story.createdAt, order: .forward)]
        )
        return try modelContext.fetch(descriptor)
    }
}
