//
//  GroceryCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct GroceryState: Equatable {}

enum GroceryAction: Equatable {
  case onAppear
  case onDisappear
}

struct GroceryEnvironment {}

// MARK: - Reducer
let groceryReducer = Reducer<GroceryState, GroceryAction, GroceryEnvironment>.combine()
