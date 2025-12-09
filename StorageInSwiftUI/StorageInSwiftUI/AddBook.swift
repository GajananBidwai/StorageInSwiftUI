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
                TextField("Insert Title", text: $titleInput)
                TextField("Insert Author", text: $authorInput)
                TextField("Insert Year", text: $yearInput)
                    .keyboardType(.numberPad)
                
                Button("Save Book") {
                    storeBook()
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Add Book")
        }
    }
    
    func storeBook() {
        let title = titleInput.trimmingCharacters(in: .whitespaces)
        let author = authorInput.trimmingCharacters(in: .whitespaces)
        
        guard let year = Int(yearInput),
              !title.isEmpty,
              !author.isEmpty else { return }
        
        let newBook = Book(title: title, author: author, year: year)
        dbContext.insert(newBook)
        
        try? dbContext.save()
        dismiss()  // Close screen
    }
}

#Preview {
    AddBook()
        .modelContainer(for: Book.self, inMemory: true)
}
