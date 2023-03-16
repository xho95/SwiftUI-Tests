//
//  CoreLocationTestApp.swift
//  CoreLocationTest
//
//  Created by Min Ho Kim on 2023/03/15.
//

import SwiftUI

@main
struct CoreLocationTestApp: App {
    @StateObject private var location = LocationDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(location)
        }
    }
}
