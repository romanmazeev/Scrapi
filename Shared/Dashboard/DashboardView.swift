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
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            makeStatisticCell(emoji: "🍴", title: "\(viewStore.selectedRecipesCount)", subtitle: "Recipes selected")
                            Spacer()
                            makeStatisticCell(emoji: "🏠", title: "\(viewStore.foodTotalQuantity) gr.", subtitle: "Food in House")
                            Spacer()
                        }
                        .listRowInsets(.init())
                        .padding(.vertical)
                        
                        makeRecipesSection(title: "Suggested for you", store: self.store.scope(state: \.suggestedRecipes, action: DashboardAction.recipe(id:action:)))
                        makeRecipesSection(title: "All recipes", store: self.store.scope(state: \.allRecipes, action: DashboardAction.recipe(id:action:)))
                        
                        if !viewStore.ingredientsNextToExpire.isEmpty {
                            VStack(alignment: .leading) {
                                Text("Ingredients to use first".uppercased())
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 12)
                                ForEach(viewStore.ingredientsNextToExpire) { ingredient in
                                    HStack {
                                        Text(ingredient.name)
                                        Spacer()
                                        
                                        Text("\(ingredient.quantity.formatted(.number.precision(.fractionLength(1)))) gr.")
                                            .foregroundColor(.gray)
                                    }
                                    .padding()
                                    .background(Color(uiColor: .secondarySystemBackground))
                                    .cornerRadius(8)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle(MainState.Tab.dashboard.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
        }
    }
    
    func makeStatisticCell(emoji: String, title: String, subtitle: String) -> some View {
        return VStack {
            Text(emoji)
                .font(.system(size: 50))
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 165, height: 165)
        .background(Color(uiColor: UIColor.tertiarySystemBackground))
        .cornerRadius(16)
        .shadow(color: .gray.opacity(0.3), radius: 20)
    }
    
    func makeRecipesSection(title: String, store: Store<IdentifiedArrayOf<RecipeState>, (String, RecipeAction)>) -> some View {
        return VStack(alignment: .leading) {
            Text(title.uppercased())
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.leading, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEachStore(store) { cellStore in
                        NavigationLink {
                            RecipeView(store: cellStore)
                        } label: {
                            RecipeCell(store: cellStore)
                                .frame(width: 200, height: 180)
                                .aspectRatio(contentMode: .fill)
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.bottom)
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
