//
//  ScrapiApp.swift
//  Shared
//
//  Created by Roman Mazeev on 12/11/21.
//

import SwiftUI

@main
struct ScrapiApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(
                store: .init(
                    initialState: .init(),
                    reducer: mainReducer,
                    environment: .init()
                )
            )
        }
    }
}
