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
//                Image(uiImage: UIImage(data: viewStore.imageData) ?? UIImage())
//                    .resizable()
                Color.white
//                    .frame(height: 160, alignment: .center)
                    .cornerRadius(16)
                HStack {
                    Text(viewStore.name)
                        .font(.footnote)
                    Spacer()
//                Image()
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
                    imageData: .init(),
                    isFavorite: false,
                    quantity: 1
                ),
                reducer: recipeReducer,
                environment: .init(recipesService: .init(), ingredientsService: .init())
            )
        )
    }
}
