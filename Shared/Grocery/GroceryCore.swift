//
//  GroceryCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture
import SwiftUI

struct GroceryState: Equatable {
    var ingredients: IdentifiedArrayOf<GroceryIngredientState> = []
    var filteredIngredients: IdentifiedArrayOf<GroceryIngredientState> {
        searchText.isEmpty ? ingredients : ingredients.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    var searchText: String = ""
}

enum GroceryAction: Equatable {
    case onAppear
    case onAddIngredient
    case onRemoveIngredient(id: String)
    case onCheckIngredient(id: String)
    case onSeachTextChange(String)
}

struct GroceryEnvironment {
    let ingredientsService: IngredientsService
}

// MARK: - Reducer
let groceryReducer = Reducer<GroceryState, GroceryAction, GroceryEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        let groceryIngredientStates = environment.ingredientsService.groceryIngredients.map(GroceryIngredientState.init(ingredient:))
        state.ingredients = IdentifiedArrayOf(uniqueElements: groceryIngredientStates)
    case .onSeachTextChange(let searchText):
        state.searchText = searchText
    case .onAddIngredient:
        break
    case .onRemoveIngredient(let id):
        guard let index = state.ingredients.firstIndex(where: { $0.id == id }) else { return .none }
        environment.ingredientsService.remove(id: id)
        state.ingredients.remove(at: index)
    case .onCheckIngredient(let id):
        guard let index = state.ingredients.firstIndex(where: { $0.id == id }) else { return .none }
        environment.ingredientsService.markAsBuyed(id: id)
        state.ingredients.remove(at: index)
    }
    
    return .none
}
