//
//  ContentView.swift
//  M4ASound
//
//  Created by Kim, Min Ho on 2021/10/14.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    let engine = AVAudioEngine()

    let url = Bundle.main.url(forResource: "Keyboard Key (0.34)", withExtension: "mp3")!
    
    var body: some View {
        Button {
            do {
                try play(url)
            } catch {
                print("\(error)")
            }
        } label: {
            Text("Hello, world!")
                .padding()
        }
    }

    func play(_ url: URL) throws {
        let file = try AVAudioFile(forReading: url)
        
        let audioPlayer = AVAudioPlayerNode()
        
        engine.attach(audioPlayer)
        
        engine.connect(audioPlayer, to: engine.mainMixerNode, format: nil)
        
        audioPlayer.scheduleFile(file, at: nil)
        
        try engine.start()
        
        audioPlayer.play()
    }
}
