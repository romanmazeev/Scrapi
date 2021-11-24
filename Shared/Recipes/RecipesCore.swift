//
//  RecipesCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct RecipesState: Equatable {
    var recipes: IdentifiedArrayOf<RecipeState> = []
    var filteredRecipes: IdentifiedArrayOf<RecipeState> {
        searchText.isEmpty ? recipes : recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    var searchText: String = ""
}

enum RecipesAction: Equatable {
    case onAppear
    case onSeachTextChange(String)
    case recipe(id: String, action: RecipeAction)
}

struct RecipesEnvironment {
    let recipesService: RecipesService
    let ingredientsService: IngredientsService
}

// MARK: - Reducer
let recipesReducer = Reducer<RecipesState, RecipesAction, RecipesEnvironment>.combine(
    recipeReducer.forEach(
        state: \.recipes,
        action: /RecipesAction.recipe(id:action:),
        environment: { environment in
            RecipeEnvironment(recipesService: environment.recipesService, ingredientsService: environment.ingredientsService)
        }
    ),
    .init { state, action, environment in
        switch action {
        case .onAppear:
            let recipes = environment.recipesService.allRecipes.map(RecipeState.init(recipe:))
            state.recipes = IdentifiedArrayOf(uniqueElements: recipes)
            
            return .none
        case .recipe(let id, let action):
            return .none
        case .onSeachTextChange(let searchText):
            state.searchText = searchText
            return .none
        }
    }
)
