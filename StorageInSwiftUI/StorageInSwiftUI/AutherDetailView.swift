//
//  AutherDetailView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI

struct AuthorDetailView: View {
    @Environment(\.modelContext) private var context

    @State private var sortAsc = true
    @State private var searchText = ""

    var author: Author

    var sortedBooks: [Book] {
        let books = author.books
    
        let filtered = searchText.isEmpty
            ? books
            : books.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        
        return filtered.sorted {
            sortAsc ? $0.title < $1.title : $0.title > $1.title
        }
    }

    var body: some View {
        List {
            ForEach(sortedBooks) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    VStack(alignment: .leading) {
                        Text(book.title)
                        Text("Year: \(book.year)")
                            .font(.caption)
                    }
                }
            }
            .onDelete(perform: deleteBook)
        }
        .navigationTitle(author.name)
        .searchable(text: $searchText)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add Book") {
                    AddBookView(author: author)
                }
            }

            ToolbarItem(placement: .topBarLeading) {
                Button(sortAsc ? "A→Z" : "Z→A") {
                    sortAsc.toggle()
                }
            }
        }
    }

    func deleteBook(at offsets: IndexSet) {
        offsets.map { sortedBooks[$0] }.forEach { context.delete($0) }
        try? context.save()
    }
}


//#Preview {
//    AuthorDetailView()
//}
