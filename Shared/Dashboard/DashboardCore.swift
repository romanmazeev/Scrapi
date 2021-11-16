//
//  DashboardCore.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture

struct DashboardState: Equatable {}

enum DashboardAction: Equatable {
  case onAppear
  case onDisappear
}

struct DashboardEnvironment {}

// MARK: - Reducer
let dashboardReducer = Reducer<DashboardState, DashboardAction, DashboardEnvironment>.combine()
