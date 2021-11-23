//
//  RecipeLoader.swift
//  Scrapi
//
//  Created by Christian Riccio on 19/11/21.
//

import Foundation

public class RecipeLoader{
    
    @Published var recipeData = [RecipeData]()
    
    init(){
        load()
    }
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "Recipes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                print(fileLocation)
                let decoder = JSONDecoder()
                let dataFromJson = try decoder.decode([RecipeData].self , from: data )
                
                self.recipeData = dataFromJson
//                print("Dati-->",recipeData)
            }catch {
                print(error)
            }
        
       
        }
    }
}
