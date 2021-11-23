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
    @State private var date : Date = Date()//To delete just to test UI
    let ingredients = ["pasta", "pumpkin", "tomatoes", "potatoes", "chicken", "banana"]
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    List {
                        ForEach(self.ingredients, id:\.self, content: {
                            ingredient in
                            HStack {
                                Text(ingredient)
                                Text("gr")
                               
                                DatePicker("", selection: $date, displayedComponents: .date)
                                
                            }
                            .swipeActions {
                                
                                Button {
                                    print("delete ingredient")
                                } label: {
                                    Label("delete", systemImage: "trash.fill")
                                }
                                .tint(.red)
                            }
                        })
                        
                        
                    }
                    
                }
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
