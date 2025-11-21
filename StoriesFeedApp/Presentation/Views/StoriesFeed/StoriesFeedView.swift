//
//  StoriesFeedView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftData
import SwiftUI

struct StoriesFeedView: View {

    @Environment(\.modelContext) private var modelContext
    @State private var selectedStory: Story?
    @State private var viewModel: StoriesFeedViewModelProtocol

    init(viewModel: StoriesFeedViewModelProtocol) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {

        // Hanldes empty state for users
        if !viewModel.hasData {
            ContentUnavailableView(
                "No Stories",
                systemImage: "photo.on.rectangle.angled",
                description: nil
            )
        } else if viewModel.isLoading {
            ProgressView {
                // This can be a 'skeleton view'
                Text("Loading...")
            }
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
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
                .padding(.horizontal)
                .padding(.vertical)
            }
            .sheet(item: $selectedStory) { story in
                StoryViewerView(story: story)
            }
        }
    }
}
