//
//  RecipeCell.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import ComposableArchitecture
import SwiftUI

struct RecipeCell: View {
    var store: Store<RecipeState, RecipeAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                Image(uiImage: viewStore.image)
                    .resizable()

                    .cornerRadius(16)
                    
                HStack {
                    Text(viewStore.name)
                        .font(.footnote)
                        .lineLimit(1)
                    Spacer()
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("\(viewStore.timeToCook) min")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

// MARK: - Previews
struct RecipeCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCell(
            store: .init(
                initialState: RecipeState(
                    id: UUID().uuidString,
                    name: "text",
                    timeToCook: 20,
                    inventoryIngredients: [],
                    groceryIngredients: [],
                    processDescription: "",
                    image: .init(),
                    isFavorite: false,
                    quantity: 1
                ),
                reducer: recipeReducer,
                environment: .init(recipesService: .init(), ingredientsService: .init())
            )
        )
    }
}
