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
                List {
                    ForEach(viewStore.filteredIngredients) { ingredient in
                        HStack {
                            Text(ingredient.name)
                            Spacer()
                            Text("\(ingredient.quantity.formatted(.number.precision(.fractionLength(1)))) gr.")
                                .foregroundColor(.gray)
                        }
                        .swipeActions {
                            Button {
                                viewStore.send(.onCheckIngredient(id: ingredient.id), animation: .default)
                            } label: {
                                Label("Check", systemImage: "checkmark")
                            }
                            .tint(.green)
                            
                            Button {
                                viewStore.send(.onRemoveIngredient(id: ingredient.id), animation: .default)
                            } label: {
                                Label("Remove", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                    }
                }
                .navigationTitle(MainState.Tab.grocery.rawValue.capitalized)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            viewStore.send(.onAddIngredient)
//                        } label: {
//                            Label("Add", systemImage: "plus")
//                        }
//                    }
//                }
            }
            .onAppear { viewStore.send(.onAppear) }
            .searchable(
                text: viewStore.binding(
                    get: \.searchText,
                    send: GroceryAction.onSeachTextChange
                )
            )
        }
    }
}

// MARK: - Previews
struct Grocery_Previews: PreviewProvider {
    static var previews: some View {
        GroceryView(
            store: .init(
                initialState: GroceryState(
                    ingredients: [
                        .init(id: UUID().uuidString, name: "Test", quantity: 200)
                    ]
                ),
                reducer: groceryReducer,
                environment: .init(ingredientsService: .init())
            )
        )
    }
}
