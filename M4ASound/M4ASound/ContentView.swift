//
//  ContentView.swift
//  M4ASound
//
//  Created by Kim, Min Ho on 2021/10/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var sound: SystemSoundID
//    @State var effectPlayer: AVAudioPlayer
//    @State var swish = SystemSoundID()
//
//    init() {
//        //            let effectPath = Bundle.main.path(forResource: "QuickSwishTrim", ofType: "mp3")!
//        //            let effectURL = URL(fileURLWithPath: effectPath)
//        effectPlayer = try! AVAudioPlayer(
//            contentsOf: Bundle.main.url(forResource: "Quick Swinging Swish (0.5)", withExtension: "mp3")!
//        )
//    }
    
    var body: some View {
        Button {
//            async let _ = effectPlayer.play()
            async let _ = AudioServicesPlaySystemSound(sound)
        } label: {
            Text("Hello, world!")
                .padding()
//                .onAppear {
//                    AudioServicesCreateSystemSoundID(url, &sound)
//                }
        }
    }
    
}

func sound() {
    var sound = SystemSoundID()
    
    AudioServicesCreateSystemSoundID(Bundle.main.url(
            forResource: "Keyboard Key (0.34)", withExtension: "mp3")! as CFURL,
        &sound)
    AudioServicesPlaySystemSound(sound)
}
