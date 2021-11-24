//
//  InventoryCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct InventoryState: Equatable {
    var ingredients: IdentifiedArrayOf<InventoryIngredientState> = []
    var filteredIngredients: IdentifiedArrayOf<InventoryIngredientState> {
        searchText.isEmpty ? ingredients : ingredients.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    var searchText: String = ""
}

enum InventoryAction: Equatable {
    case onAppear
    case onAddIngredient
    case onRemoveIngredient(id: String)
    case onSeachTextChange(String)
    case ingredient(id: String, action: InventoryIngredientAction)
}

struct InventoryEnvironment {
    let ingredientsService: IngredientsService
}

// MARK: - Reducer
let inventoryReducer = Reducer<InventoryState, InventoryAction, InventoryEnvironment>.combine(
    inventoryIngredientReducer.forEach(
        state: \.ingredients,
        action: /InventoryAction.ingredient(id:action:),
        environment: { environment in
            InventoryIngredientEnvironment(ingredientService: environment.ingredientsService)
        }
    ),
    .init { state, action, environment in
        switch action {
        case .onAppear:
            let inventoryIngredientStates = environment.ingredientsService.inventoryIngredients.map(InventoryIngredientState.init(ingredient:))
            state.ingredients = IdentifiedArrayOf(uniqueElements: inventoryIngredientStates)
            return .none
        case .onSeachTextChange(let searchText):
            state.searchText = searchText
            return .none
        case .onAddIngredient:
            return .none
        case .onRemoveIngredient(let id):
            guard let index = state.ingredients.firstIndex(where: { $0.id == id }) else { return .none }
            environment.ingredientsService.remove(id: id)
            state.ingredients.remove(at: index)
            return .none
        case .ingredient(let id, let action):
            return .none
        }
    }
)
