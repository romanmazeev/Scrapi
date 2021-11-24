//
//  InventoryIngredientCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import ComposableArchitecture

enum InventoryIngredientAction: Equatable {
    case onExpireDateChange(Date, id: String)
}

struct InventoryIngredientState: Equatable, Identifiable {
    let id: String
    let name: String
    /// In grams
    let quantity: Double
    var expireDate: Date
    
    init(ingredient: Ingredient) {
        self.id = ingredient.id
        self.name = ingredient.name
        self.quantity = ingredient.quantity
        self.expireDate = ingredient.expireDate
    }
    
    init(id: String, name: String, quantity: Double, expireDate: Date) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.expireDate = expireDate
    }
}

struct InventoryIngredientEnvironment {
    let ingredientService: IngredientsService
}

// MARK: - Reducer
let inventoryIngredientReducer = Reducer<InventoryIngredientState, InventoryIngredientAction, InventoryIngredientEnvironment> { state, action, environment in
    switch action {
    case .onExpireDateChange(let date, let id):
        environment.ingredientService.setExpireDate(date, id: id)
        return .none
    }
}
