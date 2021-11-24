//
//  RecipeCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import ComposableArchitecture

struct RecipeState: Identifiable, Equatable {
    let id: String
    let name: String
    // In minutes
    let timeToCook: Int
    let inventoryIngredients: [InventoryIngredientState]
    let groceryIngredients: [GroceryIngredientState]
    let processDescription: String
    let imageData: Data
    let isFavorite: Bool
    var quantity: Int = 1
    
    init(recipe: Recipe) {
        self.id = recipe.id
        self.name = recipe.name
        self.timeToCook = recipe.timeToCook
        self.inventoryIngredients = recipe.ingredients
            .filter { $0.isBuyed }
            .map(InventoryIngredientState.init(ingredient:))
        self.groceryIngredients = recipe.ingredients
            .filter { !$0.isBuyed }
            .map(GroceryIngredientState.init(ingredient:))
        self.processDescription = recipe.processDescription
        self.imageData = recipe.imageData
        self.isFavorite = recipe.isFavorite
    }
    
    init(
        id: String,
        name: String,
        timeToCook: Int,
        inventoryIngredients: [InventoryIngredientState],
        groceryIngredients: [GroceryIngredientState],
        processDescription: String,
        imageData: Data,
        isFavorite: Bool,
        quantity: Int
    ) {
        self.id = id
        self.name = name
        self.timeToCook = timeToCook
        self.inventoryIngredients = inventoryIngredients
        self.groceryIngredients = groceryIngredients
        self.processDescription = processDescription
        self.imageData = imageData
        self.isFavorite = isFavorite
        self.quantity = quantity
    }
}

enum RecipeAction: Equatable {
    case onAppear
    case onChangeQuantity(Int)
    case onAddToGroceryList
}

struct RecipeEnvironment {
    let recipesService: RecipesService
    let ingredientsService: IngredientsService
}

// MARK: - Reducer
let recipeReducer = Reducer<RecipeState, RecipeAction, RecipeEnvironment> { state, action, environment in
    switch action {
    case .onAppear:
        return .none
    case .onChangeQuantity(let quantity):
        state.quantity = quantity
        return .none
    case .onAddToGroceryList:
        state.groceryIngredients.forEach { ingredient in
            environment.ingredientsService.add(
                ingredient: .init(
                    id: ingredient.id,
                    name: ingredient.name,
                    expireDate: Date(),
                    quantity: ingredient.quantity * Double(state.quantity),
                    isBuyed: false
                )
            )
        }
        
        environment.recipesService.selectedRecipesCount += 1
        
        return .none
    }
}
