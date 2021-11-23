//
//  favorites.swift
//  Scrapi
//
//  Created by Christian Riccio on 23/11/21.
//

import Foundation
import SwiftUI

class Favorites: ObservableObject {
    @State var recipes = RecipeLoader().recipeData
    // the actual resorts the user has favorited
    private var recipes: Set<[RecipeData]>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        self.recipes = []
    }

    // returns true if our set contains this resort
    func contains(_ recipes: RecipeLoader().recipeData) -> Bool {
        recipes.contains(recipes.id)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ recipes: RecipeLoader().recipeData) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
    }
}
