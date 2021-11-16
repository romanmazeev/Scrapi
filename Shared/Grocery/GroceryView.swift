//
//  GroceryView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 12/11/21.
//

import ComposableArchitecture
import SwiftUI

struct GroceryView: View {
    var store: Store<GroceryState, GroceryAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                Color.gray
                    .navigationTitle(MainState.Tab.grocery.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
            .onDisappear { viewStore.send(.onDisappear) }
        }
    }
}

// MARK: - Previews
struct Grocery_Previews: PreviewProvider {
    static var previews: some View {
        GroceryView(
            store: .init(
                initialState: GroceryState(),
                reducer: groceryReducer,
                environment: .init()
            )
        )
    }
}
