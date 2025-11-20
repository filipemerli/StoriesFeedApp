//
//  StoriesFeedView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftData
import SwiftUI

struct StoriesFeedView: View {
    
    @Query private var stories: [Story]
    @State private var selectedStory: Story?

    var body: some View {

        // Hanldes empty state for users
        if stories.isEmpty {
            ContentUnavailableView(
                "No Stories",
                systemImage: "photo.on.rectangle.angled",
                description: nil
            )
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(stories) { story in
                        StoryItem(
                            story: story) {
                                selectedStory = story
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .sheet(item: $selectedStory) { story in
                StoryViewerView(story: story)
            }
        }
    }
}

#Preview {
    StoriesFeedView()
}
