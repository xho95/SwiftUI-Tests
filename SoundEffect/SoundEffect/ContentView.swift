//
//  ContentView.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/06.
//

import SwiftUI
import AVKit

class SoundManager {
    static var instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func play(option: Option) {
        guard let url = Bundle.main.url(forResource: option.rawValue, withExtension: "m4a") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("\(error.localizedDescription)")
        }
        
    }
    
    enum Option: String {
        case number = "Number Key 01"
        case delete = "Delete Key 01"
    }
}

struct ContentView: View {
    let effect: SoundManager
//    @State var backgroundOn = true
    
// Ver No. 2
// ----------------------------------------------------------------
//
//    let deleteEffect = SoundEngine(fileName: "Delete Key 01")
//    let keyEffect = SoundEngine(fileName: "Number Key 01")
    
// Ver No. 1
// ----------------------------------------------------------------
//
//    var deleteEffect: AVAudioPlayer?
//    var keyEffect: AVAudioPlayer?
//
//    init() {
//        let keyEffectURL = Bundle.main.url(forResource: "Number Key 01", withExtension: "m4a")!
//
//        keyEffect = try? AVAudioPlayer(contentsOf: keyEffectURL)
//        keyEffect?.prepareToPlay()
//
//        let deleteEffectURL = Bundle.main.url(forResource: "Delete Key 01", withExtension: "m4a")!
//
//        deleteEffect = try? AVAudioPlayer(contentsOf: deleteEffectURL)
//        deleteEffect?.prepareToPlay()
//    }
    
    var body: some View {
        VStack {
            Button {
                // play an sound effect
            } label: {
                Text("Background On")
                    .padding()
            }
            
            Button {
                effect.play(option: .delete)
            } label: {
                Text("Delete!")
                    .padding()
            }
            
            Button {
                effect.play(option: .number)
            } label: {
                Text("Number!")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(effect: SoundManager.instance)
    }
}
