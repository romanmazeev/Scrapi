//
//  Recipe.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import Foundation
import UIKit

struct Recipe {
    let id: String = UUID().uuidString
    let name: String
    // In minutes
    let timeToCook: Int
    let ingredients: [Ingredient]
    let processDescription: String
    let image: UIImage
    let isFavorite: Bool
}
