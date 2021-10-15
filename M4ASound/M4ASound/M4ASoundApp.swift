//
//  M4ASoundApp.swift
//  M4ASound
//
//  Created by Kim, Min Ho on 2021/10/14.
//

import SwiftUI
import AVKit

@main
struct M4ASoundApp: App {
    var url: CFURL = Bundle.main.url(forResource: "Keyboard Key (0.34)", withExtension: "mp3")! as CFURL
    var sound = SystemSoundID()

    var body: some Scene {
        WindowGroup {
            ContentView(sound: sound)
                .onAppear {
                    AudioServicesCreateSystemSoundID(url, &sound)
                }
        }
    }
}
