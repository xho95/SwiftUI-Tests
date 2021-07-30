//
//  TimerModelApp.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/07/30.
//

// reference : https://stackoverflow.com/questions/57796877/swift-combine-using-timer-publisher-in-an-observable-object

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
