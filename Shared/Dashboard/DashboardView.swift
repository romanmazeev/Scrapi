//
//  DashboardView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 12/11/21.
//

import ComposableArchitecture
import SwiftUI

struct DashboardView: View {
    var store: Store<DashboardState, DashboardAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                List {
                    HStack {
                        ForEach(0..<2) { index in
                            Spacer()
                            switch index {
                            case 0:
                                makeStatisticCell(emoji: "🍴", title: "\(viewStore.selectedRecipesCount)", subtitle: "Recipes selected")
                                Spacer()
                            case 1:
                                makeStatisticCell(emoji: "🏠", title: "\(viewStore.foodTotalQuantity) gr.", subtitle: "Food in House")
                            default:
                                fatalError()
                            }
                            Spacer()
                        }
                    }
                    
                    ForEach(0..<2) { index in
                        switch index {
                        case 0:
                            makeRecipesSection(title: "Suggested for you", store: self.store.scope(state: \.suggestedRecipes, action: DashboardAction.recipe(id:action:)))
                        case 1:
                            makeRecipesSection(title: "All recipes", store: self.store.scope(state: \.allRecipes, action: DashboardAction.recipe(id:action:)))
                        default:
                            fatalError()
                        }
                    }
                    
                    Section("Ingredients to use first") {
                        ForEach(viewStore.ingredientsNextToExpire) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                Spacer()
                                
                                Text("\(ingredient.quantity.formatted(.number.precision(.fractionLength(1)))) gr.")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .navigationTitle(MainState.Tab.dashboard.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
        }
    }
    
    func makeStatisticCell(emoji: String, title: String, subtitle: String) -> some View {
        return VStack(spacing: 8) {
            Text(emoji)
                .font(.system(size: 50))
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                
        }
        .padding(.vertical)
    }
    
    func makeRecipesSection(title: String, store: Store<IdentifiedArrayOf<RecipeState>, (String, RecipeAction)>) -> some View {
        return Section(title) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEachStore(store) { cellStore in
                        NavigationLink {
                            RecipeView(store: cellStore)
                        } label: {
                            RecipeCell(store: cellStore)
                                .frame(width: 200, height: 180, alignment: .center)
                        }
                    }
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowInsets(.init())
    }
}

// MARK: - Previews
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(
            store: .init(
                initialState: DashboardState(),
                reducer: dashboardReducer,
                environment: .init(ingredientsService: .init(), recipesService: .init())
            )
        )
    }
}
