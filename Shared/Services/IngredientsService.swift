//
//  IngredientsService.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import Foundation

final class IngredientsService {
    var allIngredients: [Ingredient] = [
//        .init(id: UUID().uuidString, name: "Milk", expireDate: Date(), quantity: 1000, isBuyed: true),
//        .init(id: UUID().uuidString, name: "Eggs", expireDate: Date(), quantity: 500, isBuyed: true),
//        .init(id: UUID().uuidString, name: "Broccoli", expireDate: Date(), quantity: 700, isBuyed: true),
//        .init(id: UUID().uuidString, name: "Shrimps", expireDate: Date(), quantity: 200, isBuyed: true),
//        
//        .init(id: UUID().uuidString, name: "Milk", expireDate: Date(), quantity: 1000, isBuyed: false),
//        .init(id: UUID().uuidString, name: "Eggs", expireDate: Date(), quantity: 500, isBuyed: false),
//        .init(id: UUID().uuidString, name: "Broccoli", expireDate: Date(), quantity: 700, isBuyed: false),
//        .init(id: UUID().uuidString, name: "Shrimps", expireDate: Date(), quantity: 200, isBuyed: false)
    ]
    
    var groceryIngredients: [Ingredient] {
        allIngredients.filter { !$0.isBuyed }
    }

    var inventoryIngredients: [Ingredient] {
        allIngredients.filter { $0.isBuyed }
    }
    
    var foodTotalQuantity: Double {
        allIngredients.reduce(0) { $0 + $1.quantity }
    }
    
    func markAsBuyed(id: String) {
        guard let index = allIngredients.firstIndex(where: { $0.id == id }) else { return }
        allIngredients[index].isBuyed = true
    }
    
    func setExpireDate(_ date: Date, id: String) {
        guard let index = allIngredients.firstIndex(where: { $0.id == id }) else { return }
        allIngredients[index].expireDate = date
    }
    
    func remove(id: String) {
        guard let index = allIngredients.firstIndex(where: { $0.id == id }) else { return }
        allIngredients.remove(at: index)
    }
    
    func add(ingredient: Ingredient) {
        if let ingredientIndex = allIngredients.firstIndex(where: { $0.id == ingredient.id }) {
            allIngredients[ingredientIndex].quantity += ingredient.quantity
        } else {
            allIngredients.append(ingredient)
        }
    }
}
