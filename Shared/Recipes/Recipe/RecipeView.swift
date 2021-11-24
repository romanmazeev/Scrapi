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
            ScrollView {
                VStack {
                    Image(uiImage: UIImage(data: viewStore.imageData) ?? UIImage())
                    VStack(alignment: .leading) {
                        Group {
                            HStack {
                                Text("Ingredients")
                                    .font(.headline)
                                Spacer()
                                //                          Image()
                                Text("\(viewStore.timeToCook) min.")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            ForEach(viewStore.inventoryIngredients) { ingredient in
                                Text("\(ingredient.name) - \(ingredient.quantity) gr.")
                                    .foregroundColor(.green)
                            }
                            
                            ForEach(viewStore.groceryIngredients) { ingredient in
                                Text("\(ingredient.name) - \(ingredient.quantity) gr.")
                                    .foregroundColor(.red)
                            }
                        }
                        
                        HStack {
                            Text("Process")
                                .font(.headline)
                                .padding(.vertical)
                        }
                        
                        
                        Text(viewStore.processDescription)
                            .font(.callout)
                    }
                    .padding()
                }
            }
            
            HStack {
                Group {
                    Text(String(viewStore.quantity))
                        .font(.headline)
                        .padding()
                    Stepper(
                        "",
                        value: viewStore.binding(
                            get: \.quantity,
                            send: RecipeAction.onChangeQuantity
                        ),
                        in: 1...20
                    )
                    .frame(width: 70, height: 50)
                }
                
                Spacer()
            
                Button("Add to grocery list") {
                    viewStore.send(.onAddToGroceryList)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
            .navigationTitle(viewStore.name)
            .onAppear { viewStore.send(.onAppear) }
        }
    }
}
