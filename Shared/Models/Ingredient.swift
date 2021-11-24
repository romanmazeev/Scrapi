//
//  Ingredient.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import Foundation

struct Ingredient {
    let id: String
    let name: String
    var expireDate: Date
    /// In grams
    var quantity: Double
    var isBuyed: Bool
}
