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
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                StoryItem(
                    story: .init(imageURL: "https://picsum.photos/1080/1920?random=123"),
                    onTap: {
                        print("On tapped")
                    }
                )
                StoryItem(
                    story: .init(imageURL: "https://picsum.photos/1080/1920?random=123"),
                    onTap: {
                        print("On tapped")
                    }
                )
            }
            .padding(.horizontal)
            .padding(.vertical)
        }
    }
}

#Preview {
    StoriesFeedView()
}
