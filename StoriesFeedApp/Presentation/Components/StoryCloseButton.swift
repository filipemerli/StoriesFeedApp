//
//  StoryCloseButton.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryCloseButton: View {
    
    var onTap: () -> Void
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    onTap()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding()
                        .shadow(color: .black.opacity(0.5), radius: 4, x: 0, y: 2)
                        .shadow(color: .white.opacity(0.5), radius: 4, x: 0, y: 2) // Double shadow for better contrast
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    StoryCloseButton(onTap: { print("close tapped") })
}
