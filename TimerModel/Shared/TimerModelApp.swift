//
//  TimerModelApp.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/07/30.
//

import SwiftUI

@main
struct TimerModelApp: App {
    //@EnvironmentObject private var viewModel = TimerViewModel()
    @StateObject private var viewModel = TimerViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
