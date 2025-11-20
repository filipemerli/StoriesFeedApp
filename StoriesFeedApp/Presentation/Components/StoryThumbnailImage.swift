//
//  StoryThumbnailImage.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Kingfisher
import SwiftUI

struct StoryThumbnailImage: View {

    static let mockURL = "https://picsum.photos/1080/1920?random=123"
    var body: some View {
        KFImage.url(URL(string: StoryThumbnailImage.mockURL)!)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 80, minHeight: 80)
            .clipShape(Circle())
    }
}

#Preview {
    StoryThumbnailImage()
}
