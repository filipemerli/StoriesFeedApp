//
//  StoryViewerView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct StoryViewerView: View {

    @Environment(\.dismiss) var dismiss
    @State var story: Story?

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
//        .presentationDetents([.large])
        .presentationCornerRadius(0)
        .edgesIgnoringSafeArea(.all)
    }

}

#Preview {
    StoryViewerView(story: nil)
}
