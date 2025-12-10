//
//  BookDetailView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI

struct BookDetailView: View {
    @Environment(\.modelContext) private var context

    @State var book: Book
    @State private var title = ""
    @State private var year = ""

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", text: $year)
                .keyboardType(.numberPad)

            Button("Update") {
                book.title = title
                book.year = Int(year) ?? book.year
                try? context.save()
            }
            
            Button("Delete") {
                context.delete(book)
                try? context.save()
            }
            .foregroundColor(.red)
        }
        .navigationTitle(book.title)
        .onAppear {
            title = book.title
            year = "\(book.year)"
        }
    }
}


//#Preview {
//    BookDetailView()
//}
