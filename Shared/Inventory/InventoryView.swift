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
                Color.gray
                    .navigationTitle(MainState.Tab.inventory.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
            .onDisappear { viewStore.send(.onDisappear) }
        }
    }
}

// MARK: - Previews
struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(
            store: .init(
                initialState: InventoryState(),
                reducer: inventoryReducer,
                environment: .init()
            )
        )
    }
}
