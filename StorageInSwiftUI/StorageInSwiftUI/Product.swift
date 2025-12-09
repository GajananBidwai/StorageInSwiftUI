//
//  Product.swift
//  Freshly
//
//  Created by Neosoft on 04/07/25.
//

import Foundation
import SwiftData

//@Model- macro uses a class to define the structure of the data our app can store
@Model
class Product: Identifiable {
    var id: Int
    var title: String
    var price: Float
    var category: String
    var image: String
    var rating: Rating?
    
    init(id: Int, title: String, price: Float, category: String, image: String, rating: Rating? = nil) {
        self.id = id
        self.title = title
        self.price = price
        self.category = category
        self.image = image
        self.rating = rating
    }
    
}

@Model
class Rating{
    var rate: Float
    var count: Int
    
    init(rate: Float, count: Int) {
        self.rate = rate
        self.count = count
    }
    
}
