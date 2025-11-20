//
//  StoryItem.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryItem: View {

    let story: Story
    let onTap: () -> Void

    var body: some View {
        StoryRing(isSeen: story.isSeen)
            .frame(minWidth: 130, minHeight: 130)
            .onTapGesture {
                onTap()
            }
    }
}

#Preview {
    StoryItem(
        story: .init(imageURL: "https://picsum.photos/1080/1920?random=123"),
        onTap: {
            print("Tapped")
        }
    )
}
