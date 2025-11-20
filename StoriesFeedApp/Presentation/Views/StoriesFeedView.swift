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
    @State private var viewModel: StoriesFeedViewModel?

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
                    if let viewModel {
                        ForEach(viewModel.displayedStories) { story in
                            StoryItem(
                                story: story) {
                                    selectedStory = story
                                }
                                .onAppear {
                                    viewModel.loadMoreIfNeeded(currentStory: story)
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .onAppear {
                if viewModel == nil {
                    viewModel = StoriesFeedViewModel(stories: stories)
                    viewModel?.loadInitialStories()
                }
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
