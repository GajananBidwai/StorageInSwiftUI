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
            //To run the Auther list example
            AuthorListView()
            //To run the @AppStorage example and peristing of the data storage
            //ContentView()
        }
        .modelContainer(for: [Author.self, Book.self])
    }
}
