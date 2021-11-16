//
//  RecipesView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 12/11/21.
//

import ComposableArchitecture
import SwiftUI

struct RecipesView: View {
    var store: Store<RecipesState, RecipesAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                Color.gray
                    .navigationTitle(MainState.Tab.recipes.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
            .onDisappear { viewStore.send(.onDisappear) }
        }
    }
}

// MARK: - Previews
struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView(
            store: .init(
                initialState: RecipesState(),
                reducer: recipesReducer,
                environment: .init()
            )
        )
    }
}
