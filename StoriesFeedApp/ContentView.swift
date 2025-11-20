//
//  ContentView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var stories: [Story]

    var body: some View {
        VStack {
            Text("Stories Like Feature")
                .font(.title2).bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Circle()
                        .frame(width: 130, height: 130)
                    StoryItem(
                        story: .init(imageURL: "https://picsum.photos/1080/1920?random=123"),
                        onTap: {
                            print("On tapped")
                        }
                    )
                    Circle()
                    Circle()
                    Circle()
                    Circle()
                        .frame(width: 130, height: 130)
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            .frame(height: 145)
            Rectangle()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Story.self, inMemory: true)
}
