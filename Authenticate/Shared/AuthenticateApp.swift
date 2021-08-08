//
//  AuthenticateApp.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/08/05.
//

import SwiftUI

@main
struct AuthenticateApp: App {
    let manager = GameCenterManager()
    
    var body: some Scene {
        WindowGroup {
            MenuView()
                .statusBar(hidden: true)
                .onAppear {
                    manager.authenticate()
                }
        }
    }
}
