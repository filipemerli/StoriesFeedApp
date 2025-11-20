//
//  StoryRepository.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation
import SwiftData

final class StoryRepository {

    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchAll() throws -> [Story] {
        try modelContext.fetch(FetchDescriptor<Story>())
    }

    func save(_ story: Story) {
        modelContext.insert(story)
        try? modelContext.save()
    }

    func deleteAll() {
        let stories = try? fetchAll()
        stories?.forEach { modelContext.delete($0) }
        try? modelContext.save()
    }
}
