//
//  StoryService.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Foundation
import SwiftData

@Observable
final class StoryService {

    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func markAsSeen(story: Story) {
        story.isSeen = true
        try? modelContext.save()
    }

    func toggleLike(story: Story) {
        story.isLiked.toggle()
        try? modelContext.save()
    }
}
