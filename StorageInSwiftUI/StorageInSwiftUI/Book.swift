//
//  Product.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import Foundation
import SwiftData

//@Model- macro uses a class to define the structure of the data our app can store
//@Attribute is used inside your @Model class to add extra rules to a property. It helps SwiftData understand how this property should be stored.

@Model
class Author {
    var name: String
    @Relationship(deleteRule: .cascade) var books: [Book] = []

    init(name: String) {
        self.name = name
    }
}

@Model
class Book {
    var title: String
    var year: Int
    var author: Author?

    init(title: String, year: Int, author: Author?) {
        self.title = title
        self.year = year
        self.author = author
    }
}
