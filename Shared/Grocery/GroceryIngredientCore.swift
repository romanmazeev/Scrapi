//
//  GroceryIngredientCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import Foundation

struct GroceryIngredientState: Equatable, Identifiable {
    let id: String
    let name: String
    /// In grams
    let quantity: Double
    
    init(ingredient: Ingredient) {
        self.id = ingredient.id
        self.name = ingredient.name
        self.quantity = ingredient.quantity
    }
    
    init(id: String, name: String, quantity: Double) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
}
