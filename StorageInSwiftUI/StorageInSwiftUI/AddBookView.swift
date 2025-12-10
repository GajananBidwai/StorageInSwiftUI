//
//  AddBookView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) private var context
    
    var author: Author
    
    @State private var title = ""
    @State private var year = ""

    var body: some View {
        Form {
            TextField("Book Title", text: $title)
            TextField("Year", text: $year)
                .keyboardType(.numberPad)

            Button("Save") {
                if let yr = Int(year) {
                    let newBook = Book(title: title, year: yr, author: author)
                    context.insert(newBook)
                    try? context.save()
                }
            }
        }
        .navigationTitle("Add Book")
    }
}


//#Preview {
//    AddBookView()
//}
