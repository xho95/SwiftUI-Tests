//
//  ReduxApp.swift
//  Redux
//
//  Created by Kim, Min Ho on 2021/06/03.
//

// https://medium.com/swlh/global-state-management-for-swiftui-apps-using-redux-introduction-f9cde402a70d

import SwiftUI

@main
struct ReduxApp: App {
    @StateObject var store = Store(reducer: reducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
