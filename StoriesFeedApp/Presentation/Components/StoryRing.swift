//
//  StoryRing.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryRing: View {

    var isSeen: Bool = false
    var url: String

    var body: some View {
        StoryThumbnailImage(url: url)
            .padding(6)
            .overlay(
                Circle()
                    .stroke(
                        .linearGradient(
                            colors: [.purple, .red, .yellow],
                            startPoint: .topTrailing,
                            endPoint: .bottomLeading),
                        lineWidth: 5
                    )
                    .opacity(isSeen ? 0 : 1)
            )
        
    }
}

#Preview {
    StoryRing(url: "https://picsum.photos/1080/1920?random=123")
}
