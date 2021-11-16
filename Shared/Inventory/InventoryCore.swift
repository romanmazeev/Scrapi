//
//  InventoryCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct InventoryState: Equatable {}

enum InventoryAction: Equatable {
  case onAppear
  case onDisappear
}

struct InventoryEnvironment {}

// MARK: - Reducer
let inventoryReducer = Reducer<InventoryState, InventoryAction, InventoryEnvironment>.combine()
