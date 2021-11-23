//
//  RecipesCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct RecipesState: Equatable {}

enum RecipesAction: Equatable {
    case onAppear
    case onDisappear
    case onSearchBarChange(String)
}

struct RecipesEnvironment {}

// MARK: - Reducer
let recipesReducer = Reducer<RecipesState, RecipesAction, RecipesEnvironment>.combine()
