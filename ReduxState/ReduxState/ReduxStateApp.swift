//
//  ReduxStateApp.swift
//  ReduxState
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

@main
struct ReduxStateApp: App {
    @StateObject var store = AppStore(state: .init(), reducer: appReducer, environment: World())
    
    var body: some Scene {
        WindowGroup {
            SearchContainerView()
                .environmentObject(store)
        }
    }
}
