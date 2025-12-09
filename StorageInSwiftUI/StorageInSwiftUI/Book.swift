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
class Book: Identifiable {
    var id: UUID
    var title: String
    var author: String
    var year: Int

    init(title: String, author: String, year: Int) {
        self.id = UUID()
        self.title = title
        self.author = author
        self.year = year
    }
}
