//
//  AutherListView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI
import SwiftData

struct AuthorListView: View {
    
    @Environment(\.modelContext) private var context
    @State private var searchText = ""

    // Dynamic Query with sorting + filtering
    @Query(sort: \Author.name, order: .forward)
    private var authors: [Author]

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredAuthors) { author in
                    NavigationLink(destination: AuthorDetailView(author: author)) {
                        Text(author.name)
                    }
                }
                .onDelete(perform: deleteAuthor)
            }
            .navigationTitle("Authors")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddAuthorView()
                    }
                }
            }
            .searchable(text: $searchText)
        }
    }

    var filteredAuthors: [Author] {
        if searchText.isEmpty {
            authors
        } else {
            authors.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    func deleteAuthor(at offsets: IndexSet) {
        offsets.map { authors[$0] }.forEach { context.delete($0) }
        try? context.save()
    }
}


#Preview {
    AuthorListView()
}
