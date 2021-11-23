//
//  RecipeStore.swift
//  Scrapi
//
//  Created by Christian Riccio on 18/11/21.
//

import Foundation

public struct RecipeData: Codable, Hashable, Equatable {
    
    public func hash(into hasher: inout Hasher) {
          hasher.combine(name)
      }
    public static func ==(lhs: RecipeData, rhs: RecipeData) -> Bool {
        return lhs.name == rhs.name
    }
    
    var isFavorite: Bool
    var id: Int
    var name: String
    var ingredients: [Ingredients]
    var steps: [String]
    var imageURL: String
    public var timers: [Int]
    
    var sum: Int {timers.reduce(0,+)}
    
}



struct Ingredients: Codable, Hashable {
    var quantity: String
    var name: String
    var type: String
}





