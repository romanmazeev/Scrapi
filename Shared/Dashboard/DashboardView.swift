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
                Color.gray
                    .navigationTitle(MainState.Tab.dashboard.rawValue.capitalized)
            }
            .onAppear { viewStore.send(.onAppear) }
            .onDisappear { viewStore.send(.onDisappear) }
        }
    }
}

// MARK: - Previews
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(
            store: .init(
                initialState: DashboardState(),
                reducer: dashboardReducer,
                environment: .init()
            )
        )
    }
}
