//
//  BookList.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI
import SwiftData

struct BooksList: View {
    
    @Query(sort: \Book.title) private var books: [Book]
    @Environment(\.modelContext) private var context
    
    @State private var showAddBook = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .font(.title3)
                        
                        Text("Author: \(book.author)")
                            .foregroundStyle(.secondary)
                        
                        Text("Year: \(book.year)")
                            .foregroundStyle(.secondary)
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("My Books")
            .toolbar {
                Button(action: { showAddBook = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddBook) {
                AddBook()
            }
        }
    }
    
    func deleteBook(at offsets: IndexSet) {
        for index in offsets {
            context.delete(books[index])
        }
        try? context.save()
    }
}
