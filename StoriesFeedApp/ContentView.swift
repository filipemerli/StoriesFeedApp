//
//  ContentView.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI

struct ContentView: View {
    let appDependencies: AppDependencies

    var body: some View {
        VStack {
            Text("Stories Like Feature")
                .font(.title2).bold()
            StoriesFeedView(viewModel: appDependencies.makeStoriesFeedViewModel())
            .frame(height: 145)
            Rectangle()
        }
    }
}
