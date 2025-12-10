import SwiftUI
import SwiftData

struct AddBook: View {
    
    @Environment(\.modelContext) private var dbContext
    
    @State private var titleInput: String = ""
    @State private var authorInput: String = ""
    @State private var yearInput: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Insert Title", text: $titleInput)
                    TextField("Insert Author", text: $authorInput)
                    TextField("Insert Year", text: $yearInput)
                        .keyboardType(.numberPad)
                }
                
                Button(action: storeBook) {
                    Text("Save Book")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Add Book")
        }
    }
    
    func storeBook() {
        let title = titleInput.trimmingCharacters(in: .whitespaces)
        let authorName = authorInput.trimmingCharacters(in: .whitespaces)
        
        guard let year = Int(yearInput),
              !title.isEmpty,
              !authorName.isEmpty else { return }
        let descriptor = FetchDescriptor<Author>(
            predicate: #Predicate { $0.name == authorName }
        )
        
        let matchingAuthors = (try? dbContext.fetch(descriptor)) ?? []
        let author: Author
        if let existingAuthor = matchingAuthors.first {
            author = existingAuthor
        } else {
            author = Author(name: authorName)
            dbContext.insert(author)
        }

        let newBook = Book(title: title, year: year, author: author)
        dbContext.insert(newBook)
        
        do {
            try dbContext.save()
            dismiss()
        } catch {
            print("Failed to save:", error.localizedDescription)
        }
    }
}

#Preview {
    AddBook()
        .modelContainer(for: Book.self, inMemory: true)
}

