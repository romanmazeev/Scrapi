//
//  RecipesService.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import Foundation

final class RecipesService {
    var allRecipes: [Recipe] = [
        .init(
            name: "Test",
            timeToCook: 20,
            ingredients: [
                .init(id: UUID().uuidString, name: "Brocolli", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pasta", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Cheese", expireDate: Date(), quantity: 20, isBuyed: false),
            ],
            processDescription: "Description",
            imageData: Data(),
            isFavorite: false
        ),
        .init(
            name: "Test test",
            timeToCook: 20,
            ingredients: [
                .init(id: UUID().uuidString, name: "Brocolli", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pasta", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Cheese", expireDate: Date(), quantity: 20, isBuyed: false),
            ],
            processDescription: "das;ldkas;ldks",
            imageData: Data(),
            isFavorite: false
        ),
        .init(
            name: "Test test",
            timeToCook: 20,
            ingredients: [
                .init(id: UUID().uuidString, name: "Brocolli", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pasta", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Cheese", expireDate: Date(), quantity: 20, isBuyed: false),
            ],
            processDescription: "das;ldkas;ldks",
            imageData: Data(),
            isFavorite: false
        ),
        .init(
            name: "Test test",
            timeToCook: 20,
            ingredients: [
                .init(id: UUID().uuidString, name: "Brocolli", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pasta", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Cheese", expireDate: Date(), quantity: 20, isBuyed: false),
            ],
            processDescription: "das;ldkas;ldks",
            imageData: Data(),
            isFavorite: false
        )
    ]
    
    var selectedRecipesCount = 0
}
