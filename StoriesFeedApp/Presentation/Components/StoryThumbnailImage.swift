//
//  StoryThumbnailImage.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import Kingfisher
import SwiftUI

struct StoryThumbnailImage: View {

    let url: String

    var body: some View {
        if let validUrl = URL(string: url) {
            KFImage.url(validUrl)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 80, minHeight: 80)
                .clipShape(Circle())
        } else {
            Image(systemName: "xmark")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 80, minHeight: 80)
            .clipShape(Circle())
        }
    }
}

#Preview {
    StoryThumbnailImage(url: "https://picsum.photos/1080/1920?random=123")
}
