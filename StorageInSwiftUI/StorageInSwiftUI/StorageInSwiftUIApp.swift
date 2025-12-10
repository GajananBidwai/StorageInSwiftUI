//
//  StorageInSwiftUIApp.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI
import SwiftData

@main
struct StorageInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            AuthorListView()
        }
        .modelContainer(for: [Author.self, Book.self])
    }
}
