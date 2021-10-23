//
//  AVAudioEngineApp.swift
//  AVAudioEngine
//
//  Created by Kim, Min Ho on 2021/10/20.
//

import SwiftUI

@main
struct AVAudioEngineApp: App {
    let musicURL = Bundle.main.url(forResource: "QuickSwish", withExtension: "mp3")!

    var body: some Scene {
        WindowGroup {
            ContentView(url: musicURL)
        }
    }
}
