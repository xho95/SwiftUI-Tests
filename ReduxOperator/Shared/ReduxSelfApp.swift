//
//  ReduxSelfApp.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import SwiftUI

@main
struct ReduxSelfApp: App {
    @StateObject private var store = ReduxSelfStore(initial: AppState())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
