//
//  MainCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture
import Foundation

struct MainState: Equatable {
    var dashboardState = DashboardState()
    var recipesState = RecipesState()
    var inventoryState = InventoryState()
    var groceryState = GroceryState()
    
    enum Tab: String {
        case dashboard
        case recipes
        case inventory
        case grocery
    }
    
    var selectedTab = Tab.dashboard
}

enum MainAction {
    case dashboard(DashboardAction)
    case recipes(RecipesAction)
    case inventory(InventoryAction)
    case grocery(GroceryAction)
    
    case selectedTabChange(MainState.Tab)
}

struct MainEnvironment {
    let ingredientsService = IngredientsService()
    let recipesService = RecipesService()
}

// MARK: - Reducer
let mainReducer: Reducer<MainState, MainAction, MainEnvironment> = .combine(
    dashboardReducer.pullback(
        state: \MainState.dashboardState,
        action: /MainAction.dashboard,
        environment: { environment in
            DashboardEnvironment(ingredientsService: environment.ingredientsService, recipesService: environment.recipesService)
        }
    ),
    recipesReducer.pullback(
        state: \MainState.recipesState,
        action: /MainAction.recipes,
        environment: { environment in
            RecipesEnvironment(recipesService: environment.recipesService, ingredientsService: environment.ingredientsService)
        }
    ),
    inventoryReducer.pullback(
        state: \MainState.inventoryState,
        action: /MainAction.inventory,
        environment: { environment in
            InventoryEnvironment(ingredientsService: environment.ingredientsService)
        }
    ),
    groceryReducer.pullback(
        state: \MainState.groceryState,
        action: /MainAction.grocery,
        environment: { environment in
            GroceryEnvironment(ingredientsService: environment.ingredientsService)
        }
    ),
    .init { state, action, environment in
        switch action {
        case .selectedTabChange(let selectedTab):
            state.selectedTab = selectedTab
            return .none
        case .dashboard:
            return .none
        case .recipes:
            return .none
        case .inventory:
            return .none
        case .grocery:
            return .none
        }
    }
)
