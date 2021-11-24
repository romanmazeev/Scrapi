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
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 130), spacing: 16), count: 2)
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: items, alignment: .center) {
                        ForEachStore(self.store.scope(state: \.filteredRecipes, action: RecipesAction.recipe(id:action:))) { cellStore in
                            NavigationLink {
                                RecipeView(store: cellStore)
                            } label: {
                                RecipeCell(store: cellStore)
                                    .frame(height: 140)
                            }
                            
                        }
                    }
                }
                .padding()
                .navigationTitle(MainState.Tab.recipes.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
            .searchable(
                text: viewStore.binding(
                    get: \.searchText,
                    send: RecipesAction.onSeachTextChange
                )
            )
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
                environment: .init(recipesService: .init(), ingredientsService: .init())
            )
        )
    }
}
