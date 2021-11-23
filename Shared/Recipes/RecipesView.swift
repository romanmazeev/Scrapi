//
//  RecipesView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 12/11/21.
//

import ComposableArchitecture
import SwiftUI
//import Speech

struct RecipesView: View {
    
    @State private var searchTerm: String = ""
    @State private var recipe_loader = RecipeLoader()
    @State private var recipes = [RecipeData]()

    //    let recipes_list = ["recipe1", "recipe2", "recipe3"]
    var store: Store<RecipesState, RecipesAction>
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .center) {
                    ForEach(recipe_loader.recipeData, id: \.name) { recipe in
                        NavigationLink(destination: nextViewRecipes(recipe: recipe), label:
                            {CardView(name: recipe.name, imagePath: recipe.imageURL)})
                        if recipe.isFavorite {
                            Image(systemName: "heart.fill").foregroundColor(.red)
                        }
                    }
                    .searchable(text: $searchTerm)
                    .navigationTitle(MainState.Tab.recipes.rawValue.capitalized)
                    .navigationBarTitleTextColor(.green)
                    }.padding(.horizontal)
                }
            }
            
            
            .onAppear { viewStore.send(.onAppear) }
            .onDisappear { viewStore.send(.onDisappear) }
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
                environment: .init()
            )
        )
    }
}
