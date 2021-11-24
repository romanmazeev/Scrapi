//
//  ScrapiAppView.swift
//  Scrapi
//
//  Created by Roman Mazeev on 16/11/21.
//

import ComposableArchitecture
import SwiftUI

struct MainView: View {
    let store: Store<MainState, MainAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: { $0.selectedTab },
                    send: MainAction.selectedTabChange
                ),
                content: {
                    Group {
                        DashboardView(store: dashboardStore)
                            .tabItem {
                                Image(systemName: "house")
                                Text(MainState.Tab.dashboard.rawValue.capitalized)
                            }
                            .tag(MainState.Tab.dashboard)
                        RecipesView(store: recipesStore)
                            .tabItem {
                                Image(systemName: "note.text")
                                Text(MainState.Tab.recipes.rawValue.capitalized)
                            }
                            .tag(MainState.Tab.recipes)
                        InventoryView(store: inventoryStore)
                            .tabItem {
                                Image(systemName: "cart")
                                Text(MainState.Tab.inventory.rawValue.capitalized)
                            }
                            .tag(MainState.Tab.inventory)
                        GroceryView(store: groceryStore)
                            .tabItem {
                                Image(systemName: "list.bullet")
                                Text(MainState.Tab.grocery.rawValue.capitalized)
                            }
                            .tag(MainState.Tab.grocery)
                    }
                    .navigationBarTitleTextColor(.accentColor)
                }
            )
        }
    }
}

// MARK: - Store inits
extension MainView {
    private var dashboardStore: Store<DashboardState, DashboardAction> {
        return store.scope(
            state: { $0.dashboardState },
            action: MainAction.dashboard
        )
    }
    
    private var recipesStore: Store<RecipesState, RecipesAction> {
        return store.scope(
            state: { $0.recipesState },
            action: MainAction.recipes
        )
    }
    
    private var inventoryStore: Store<InventoryState, InventoryAction> {
        return store.scope(
            state: { $0.inventoryState },
            action: MainAction.inventory
        )
    }
    
    private var groceryStore: Store<GroceryState, GroceryAction> {
        return store.scope(
            state: { $0.groceryState },
            action: MainAction.grocery
        )
    }
}

// MARK: - Previews
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(
            store: .init(
                initialState: MainState(),
                reducer: mainReducer,
                environment: .init()
            )
        )
    }
}
