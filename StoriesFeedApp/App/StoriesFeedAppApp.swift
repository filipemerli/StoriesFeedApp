//
//  StoriesFeedAppApp.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 20/11/2025.
//

import SwiftUI
import SwiftData

@main
struct StoriesFeedAppApp: App {

    private let sharedModelContainer: ModelContainer
    private let appDependencies: AppDependencies

    init() {
        // Initialize ModelContainer
        let schema = Schema([Story.self])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            let container = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
            self.sharedModelContainer = container

            let context = ModelContext(container)
            self.appDependencies = AppDependencies(modelContext: context)

            let repository = StoryRepository(modelContext: context)
            let provider = StoryProvider(repository: repository)
            provider.provideIfNeeded()

        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            /// I'm assuming ContentView has a Coordinator like responsability for this prototype
            ContentView(appDependencies: appDependencies)
        }
        .modelContainer(sharedModelContainer)
    }
}
