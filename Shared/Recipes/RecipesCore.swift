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
}

struct RecipesEnvironment {}

// MARK: - Reducer
let recipesReducer = Reducer<RecipesState, RecipesAction, RecipesEnvironment>.combine()
