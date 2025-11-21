//
//  AppDependencies.swift
//  StoriesFeedApp
//
//  Created by Filipe Merli on 21/11/2025.
//

import Foundation
import SwiftData
import SwiftUICore


@MainActor
@Observable
final class AppDependencies {
    let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func makeStoriesFeedViewModel() -> StoriesFeedViewModelProtocol {
        let repository = StoriesRepository(modelContext: modelContext)
        return StoriesFeedViewModel(repository: repository)
    }
}

private struct AppDependenciesKey: EnvironmentKey {
    static let defaultValue: AppDependencies? = nil
}

extension EnvironmentValues {
    var appDependencies: AppDependencies? {
        get { self[AppDependenciesKey.self] }
        set { self[AppDependenciesKey.self] = newValue }
    }
}
