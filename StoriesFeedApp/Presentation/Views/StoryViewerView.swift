//
//  StoryViewerView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Kingfisher
import SwiftData
import SwiftUI

struct StoryViewerView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    let story: Story

    private var storyService: StoryService {
        StoryService(modelContext: modelContext)
    }

    var body: some View {
        ZStack {

            KFImage(URL(string: story.imageURL))
                .placeholder {
                    ZStack {
                        Circle()
                            .fill(Color.gray.opacity(0.2))
                        ProgressView()
                            .tint(.gray)
                    }
                    .frame(width: 80, height: 80)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            StoryCloseButton {
                dismiss()
            }.padding(.horizontal)
            StoryLikeButton(
                onTap: {
                    storyService.toggleLike(story: story)

                },
                isLiked: story.isLiked
            )
        }
        .onAppear {
            storyService.markAsSeen(story: story)
        }
        .presentationDetents([.large])
        .presentationCornerRadius(0)
    }
}

#Preview {
    StoryViewerView(story: Story(imageURL: "https://picsum.photos/1080/1920?random=123"))
}
