//
//  AddAutherView.swift
//  StorageInSwiftUI
//
//  Created by Neosoft on 09/12/25.
//

import SwiftUI

struct AddAuthorView: View {
    @Environment(\.modelContext) private var context
    
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Author Name", text: $name)

            Button("Save") {
                let newAuthor = Author(name: name)
                context.insert(newAuthor)
                try? context.save()
            }
        }
        .navigationTitle("Add Author")
    }
}


#Preview {
    AddAuthorView()
}
