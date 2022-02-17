//
//  SoundEffectApp.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/06.
//

import SwiftUI

@main
struct SoundEffectApp: App {
    let effect = SoundManager.instance
    @StateObject var sound = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(effect: effect)
                .environmentObject(sound)
        }
    }
}
