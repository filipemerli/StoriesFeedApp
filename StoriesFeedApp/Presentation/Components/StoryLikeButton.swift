//
//  StoryLikeButton.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryLikeButton: View {

    var onTap: () -> Void
    var isLiked: Bool

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    onTap()
                } label: {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundStyle(isLiked ? .red : .white)
                        .padding()
                        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
                        .shadow(color: .white.opacity(0.5), radius: 4, x: 0, y: 2)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isLiked)// Double shadow for better contrast
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    StoryLikeButton(onTap: { print("Like tapped") }, isLiked: true)
}
