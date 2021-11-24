//
//  RecipeView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import ComposableArchitecture
import SwiftUI

struct RecipeView: View {
    var store: Store<RecipeState, RecipeAction>
    @Environment(\.dismiss) var dismiss
    
    var items: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 130), spacing: 16), count: 2)
    }
    
    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                List {
                    Section("Ingredients") {
                        ForEach(viewStore.inventoryIngredients) { ingredient in
                            Text("\(ingredient.name) - \(ingredient.quantity) gr.")
                        }
                        
                        ForEach(viewStore.groceryIngredients) { ingredient in
                            Text("\(ingredient.name) - \(ingredient.quantity) gr.")
                        }
                    }
                    
                    Section(
                        content: {
                            Text(viewStore.processDescription)
                        },
                        header: {
                            HStack {
                                Text("Process")
                                Spacer()
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                Text("\(viewStore.timeToCook) min.")
                                    .foregroundColor(.gray)
                            }
                        }
                    )
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Group {
                        Text(String(viewStore.quantity))
                            .font(.headline)
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
                        Stepper(
                            "",
                            value: viewStore.binding(
                                get: \.quantity,
                                send: RecipeAction.onChangeQuantity
                            ),
                            in: 1...20
                        )
                        .frame(width: 50, height: 50)
                        }
                        .padding()
                        
                        Spacer()
                        
                        Button("Add to grocery list") {
                            viewStore.send(.onAddToGroceryList)
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                        .padding()
                    }
                    .background(Color(uiColor: .tertiarySystemBackground))
                }
            }
            .navigationTitle(viewStore.name)
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}
