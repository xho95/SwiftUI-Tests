//
//  ContentView.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/06.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var backgroundOn = true
    
    var deleteEffect: AVAudioPlayer?
    var keyEffect: AVAudioPlayer?

    init() {
        let keyEffectURL = Bundle.main.url(forResource: "Number Key 01", withExtension: "m4a")!
        
        keyEffect = try? AVAudioPlayer(contentsOf: keyEffectURL)
        keyEffect?.prepareToPlay()

        let deleteEffectURL = Bundle.main.url(forResource: "Delete Key 01", withExtension: "m4a")!
        
        deleteEffect = try? AVAudioPlayer(contentsOf: deleteEffectURL)
        deleteEffect?.prepareToPlay()
    }
    
    var body: some View {
        VStack {
            Button {
                // play an sound effect
            } label: {
                Text(backgroundOn ? "Background Off" : "Background On")
                    .padding()
            }
            
            Button {
                deleteEffect?.currentTime = 0
                deleteEffect?.play()
            } label: {
                Text("Delete!")
                    .padding()
            }
            
            Button {
                keyEffect?.currentTime = 0
                keyEffect?.play()
            } label: {
                Text("Number!")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
