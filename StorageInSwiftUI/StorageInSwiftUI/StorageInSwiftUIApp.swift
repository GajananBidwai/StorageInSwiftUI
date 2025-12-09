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
    
    @State private var product = Product(id: 0, title: "", price: 0, category: "", image: "", rating: Rating(rate: 0, count: 0))
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //Container should tells the compiler that we can able to get a access to every view
                .environment(product)
                .modelContainer(for: [Product.self])
            
        }
    }
}
