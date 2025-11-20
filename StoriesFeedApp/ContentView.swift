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
            StoriesFeedView()
            .frame(height: 145)
            Rectangle()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Story.self, inMemory: true)
}
