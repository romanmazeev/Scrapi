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
    let ingredients = ["pasta", "pumpkin", "tomatoes", "potatoes", "chicken", "banana"]
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                VStack {
                    List {
                        ForEach(self.ingredients, id:\.self, content: {
                            ingredient in
                            HStack {Text(ingredient)
                                Text("gr")
                                Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                                }
                                
                            }
                            .swipeActions {
                                Button {
                                    print("check ingredient")
                                } label: {
                                    Label("Check", systemImage: "checkmark")
                                }
                                .tint(.green)
                                
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
    }
}
}
