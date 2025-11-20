//
//  StoryRing.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryRing: View {

    var isSeen: Bool = false

    var body: some View {
        StoryThumbnailImage()
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
    StoryRing()
}
