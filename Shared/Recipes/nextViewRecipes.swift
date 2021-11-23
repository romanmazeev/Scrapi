//
//  nextViewRecipes.swift
//  Scrapi
//
//  Created by Christian Riccio on 22/11/21.
//

import SwiftUI

struct nextViewRecipes: View {
    
    @State var recipe: RecipeData
    
    var recipe_ = RecipeLoader()
    var body: some View {
        ScrollView(.vertical){
            Text(recipe.name).font(.title).bold().foregroundColor(.green)
            Image(recipe.imageURL).scaledToFit().padding(.all).clipShape(RoundedRectangle(cornerRadius: 20))
            HStack {
                
            Text("Cooking time: ")
                Text(String(recipe.sum))
                Text("minute")
            }
            Spacer()
            Text("Ingredients: ").bold().font(.title2)
            Spacer()
            ForEach(recipe.ingredients, id: \.self){ingridient in
                VStack {
                    HStack {
                        Text("-")
                        Text(ingridient.name).bold().font(.title3).foregroundColor(.secondary)
                        Text(":").padding(.horizontal).font(.title3)
                        Text(ingridient.quantity).font(.title3).foregroundColor(.secondary).frame( alignment: .center)
                    }
                    
                    
                }
                
                
            }
            Text("Cooking: ").bold().font(.title2)
            ForEach(recipe.steps, id:\.self) {step in
                Text(step).bold().frame(alignment: .center).foregroundColor(.secondary).padding(.horizontal)
            }
        }
    }
}


//struct nextViewRecipes_Previews: PreviewProvider {
//    static var previews: some View {
//        nextViewRecipes(recipe: recipe[0])
//    }
//}
