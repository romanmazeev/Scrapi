//
//  DashboardCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct DashboardState: Equatable {
    var selectedRecipesCount: Int = 0
    var foodTotalQuantity: Double = 0
    var ingredientsNextToExpire: [InventoryIngredientState] = []
    var suggestedRecipes: IdentifiedArrayOf<RecipeState> = []
    var allRecipes: IdentifiedArrayOf<RecipeState> = []
}

enum DashboardAction: Equatable {
    case onAppear
    case recipe(id: String, action: RecipeAction)
}

struct DashboardEnvironment {
    let ingredientsService: IngredientsService
    let recipesService: RecipesService
}

// MARK: - Reducer
let dashboardReducer = Reducer<DashboardState, DashboardAction, DashboardEnvironment>.combine(
    recipeReducer.forEach(
        state: \.suggestedRecipes,
        action: /DashboardAction.recipe(id:action:),
        environment: { environment in
            RecipeEnvironment(recipesService: environment.recipesService, ingredientsService: environment.ingredientsService)
        }
    ),
    .init { state, action, environment in
        switch action {
        case .onAppear:
            state.ingredientsNextToExpire = Array(
                environment.ingredientsService.inventoryIngredients
                    .sorted(by: { a, b in
                        a.expireDate > b.expireDate
                    })
                    .map(InventoryIngredientState.init(ingredient:))
                    .prefix(10)
            )
            
            let recipes = environment.recipesService.allRecipes.map(RecipeState.init(recipe:))
            state.allRecipes = IdentifiedArrayOf(uniqueElements: recipes)
            
            // TODO: Select special recipes
            state.suggestedRecipes = IdentifiedArrayOf(uniqueElements: recipes)
            
            state.selectedRecipesCount = environment.recipesService.selectedRecipesCount
            state.foodTotalQuantity = environment.ingredientsService.foodTotalQuantity
            
            return .none
        case .recipe(let id, let action):
            return .none
        }
    }
)
