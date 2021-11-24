//
//  RecipesService.swift
//  Scrapi
//
//  Created by Roman Mazeev on 23/11/21.
//

import SwiftUI

final class RecipesService {
    var allRecipes: [Recipe] = [
        .init(
            name: "Roman Sheep Herder's Pasta",
            timeToCook: 25,
            ingredients: [
                .init(id: UUID().uuidString, name: "Salt", expireDate: Date(), quantity: 20, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pound bucatini (dry)", expireDate: Date(), quantity: 100, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pecorino Romano cheese", expireDate: Date(), quantity: 30, isBuyed: false),
                .init(id: UUID().uuidString, name: "Black pepper", expireDate: Date(), quantity: 30, isBuyed: false)
            ],
            processDescription: """
                                Step 1.
                                Bring a large pot of water to a boil and add salt. Cook bucatini in the boiling water, stirring occasionally, until tender yet firm to the bite, 8 to 10 minutes.

                                Step 2.
                                Place grated Pecorino Romano cheese into a large glass bowl and mix with a fork to make sure the cheese contains no lumps.

                                Step 3.
                                Once the bucatini are al dente, lift them out with a spaghetti fork or tongs and put them directly into the bowl with the cheese. Do not allow the water to drain too much.

                                Step 4.
                                Add one ladle of pasta water to the bowl. Stir the bucatini around until a cream has formed. Add more pasta water, little by little, until a thick cream has formed. Sprinkle freshly ground pepper over the pasta. Toss and serve immediately.
                                """,
            image: UIImage(named: "RomanSheepHerdersPasta")!,
            isFavorite: false
        ),
        .init(
            name: "Italian Shrimp and Scallop Risotto",
            timeToCook: 35,
            ingredients: [
                .init(id: UUID().uuidString, name: "Olive oil", expireDate: Date(), quantity: 100, isBuyed: false),
                .init(id: UUID().uuidString, name: "Garlic", expireDate: Date(), quantity: 50, isBuyed: false),
                .init(id: UUID().uuidString, name: "Shrimps", expireDate: Date(), quantity: 300, isBuyed: false),
            ],
            processDescription: """
                                Step 1.
                                Heat 3 tablespoons olive oil in a skillet over a medium heat. Add garlic; cook and stir until starting to sizzle, about 2 minutes. Stir in scallops and cook for 1 minute. Add shrimp and season with salt, pepper, and red pepper flakes. Cook over high heat until shrimp are pink, 3 to 5 minutes.

                                Step 2.
                                Pour 1/2 cup white wine into the skillet and let the alcohol evaporate. Scrape the bottom of the skillet to deglaze; cook until the liquid is reduced, 2 to 3 minutes. Remove from heat, add lemon juice, and sprinkle with 1/2 of the parsley. Discard garlic. Cover the skillet to keep shellfish warm.

                                Step 3.
                                Pour fish stock into a saucepan over medium heat and bring to a simmer.

                                Step 4.
                                Melt butter in a skillet over low heat. Add 1 tablespoon olive oil and shallot. Cook until shallot is soft and translucent, but not brown, 3 to 5 minutes. Increase heat and add rice; cook until rice has absorbed the oil and butter and has a nutty aroma, stirring often, 1 to 2 minutes. Make sure not to burn the shallot and reduce heat if skillet gets too hot.

                                Step 5.
                                Pour 1/2 cup white wine into the skillet and stir until alcohol has evaporated. Add 1 ladleful of fish stock, stir, and cook until rice has absorbed the stock. Add another ladleful and repeat the process until the rice is tender, 15 to 18 minutes in total.

                                Step 6.
                                Add shellfish with their juices to the risotto pan 3 minutes before the end of cooking. Stir and finish cooking all together, adding stock if needed. Remove from heat. Stir in remaining parsley and 1 tablespoon extra-virgin olive oil. Let risotto stand for 2 minutes before serving.
                                """,
            image: UIImage(named: "ItalianShrimpAndScallop")!,
            isFavorite: false
        ),
        .init(
            name: "Penne all'arrabbiata",
            timeToCook: 20,
            ingredients: [
                .init(id: UUID().uuidString, name: "Tomato", expireDate: Date(), quantity: 300, isBuyed: false),
                .init(id: UUID().uuidString, name: "Pasta", expireDate: Date(), quantity: 100, isBuyed: false),
                .init(id: UUID().uuidString, name: "Cheese", expireDate: Date(), quantity: 50, isBuyed: false),
            ],
            processDescription: """
                                1.
                                To begin, heat a tablespoon of olive oil on a low heat in a pan and gently soften the minced garlic. Take care, as this won’t take long at all and you don’t want any colour on the garlic or it will impart a bitter flavour into the sauce
                                2.
                                Add the chilli flakes to the oil, temper for 10 seconds, then add the tin of tomatoes (if they are whole tomatoes, roughly chop them first)
                                3.
                                Cook down over a low heat for 10–15 minutes until the sauce has thickened. Taste and add salt and a little sugar if necessary
                                4.
                                Cook the penne in a pan of heavily salted boiling water for 8–10 minutes or as per packet instructions
                                5.
                                Once the pasta is cooked al dente, drain and add it to the sauce, tossing to make sure the pasta is evenly coated
                                6.
                                Serve straight away and garnish with torn basil
                                """,
            image: UIImage(named: "PenneAllArrabbiata")!,
            isFavorite: false
        ),
        .init(
            name: "Lasagna",
            timeToCook: 180,
            ingredients: [
                .init(id: UUID().uuidString, name: "Water", expireDate: Date(), quantity: 500, isBuyed: false),
                .init(id: UUID().uuidString, name: "Sugar", expireDate: Date(), quantity: 50, isBuyed: false),
                .init(id: UUID().uuidString, name: "Tomato", expireDate: Date(), quantity: 100, isBuyed: false),
            ],
            processDescription: """
                                Step 1.
                                In a Dutch oven, cook sausage, ground beef, onion, and garlic over medium heat until well browned. Stir in crushed tomatoes, tomato paste, tomato sauce, and water. Season with sugar, basil, fennel seeds, Italian seasoning, 1 teaspoon salt, pepper, and 2 tablespoons parsley. Simmer, covered, for about 1 1/2 hours, stirring occasionally.

                                Step 2.
                                Bring a large pot of lightly salted water to a boil. Cook lasagna noodles in boiling water for 8 to 10 minutes. Drain noodles, and rinse with cold water. In a mixing bowl, combine ricotta cheese with egg, remaining parsley, and 1/2 teaspoon salt.

                                Step 3.
                                Preheat oven to 375 degrees F (190 degrees C).

                                Step 4.
                                To assemble, spread 1 1/2 cups of meat sauce in the bottom of a 9x13-inch baking dish. Arrange 6 noodles lengthwise over meat sauce. Spread with one half of the ricotta cheese mixture. Top with a third of mozzarella cheese slices. Spoon 1 1/2 cups meat sauce over mozzarella, and sprinkle with 1/4 cup Parmesan cheese. Repeat layers, and top with remaining mozzarella and Parmesan cheese. Cover with foil: to prevent sticking, either spray foil with cooking spray, or make sure the foil does not touch the cheese.

                                Step 5.
                                Bake in preheated oven for 25 minutes. Remove foil, and bake an additional 25 minutes. Cool for 15 minutes before serving.
                                """,
            image: UIImage(named: "Lasagna")!,
            isFavorite: false
        )
    ]
    
    var selectedRecipesCount = 0
}
