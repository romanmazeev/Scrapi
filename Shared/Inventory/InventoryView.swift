//
//  InventoryView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 12/11/21.
//

import ComposableArchitecture
import SwiftUI

struct InventoryView: View {
    var store: Store<InventoryState, InventoryAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    ForEachStore(self.store.scope(state: \.filteredIngredients, action: InventoryAction.ingredient(id:action:))) { rowStore in
                        WithViewStore(rowStore) { rowViewStore in
                            HStack {
                                Text(rowViewStore.name)
                                Spacer()
                                Text("\(rowViewStore.quantity.formatted(.number.precision(.fractionLength(1)))) gr.")
                                    .foregroundColor(.gray)
                                DatePicker(
                                    "",
                                    selection: rowViewStore.binding(
                                        get: \.expireDate, send: { InventoryIngredientAction.onExpireDateChange($0, id: rowViewStore.id) }
                                    ),
                                    displayedComponents: .date
                                )
                            }
                            .swipeActions {
                                Button {
                                    viewStore.send(.onRemoveIngredient(id: rowViewStore.id), animation: .default)
                                } label: {
                                    Label("delete", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        }
                    }
                }
                .navigationTitle(MainState.Tab.inventory.rawValue.capitalized)
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
                    send: InventoryAction.onSeachTextChange
                )
            )
        }
    }
}

// MARK: - Previews
struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(
            store: .init(
                initialState: InventoryState(
                    ingredients: [
                        .init(id: UUID().uuidString, name: "Test", quantity: 200, expireDate: Date())
                    ]
                ),
                reducer: inventoryReducer,
                environment: .init(ingredientsService: .init())
            )
        )
    }
}
