//
//  SoundManager.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/16.
//

import Foundation
import AVKit

class SoundManager {
    static var instance = SoundManager()
    
    var player: AVAudioPlayer?
    var numberPlayer: AVAudioPlayer?

    init() {
        guard let url = Bundle.main.url(forResource: Option.number.rawValue, withExtension: "m4a") else { return }
        
        do {
            numberPlayer = try AVAudioPlayer(contentsOf: url)
            numberPlayer?.prepareToPlay()
//            player?.play()
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func play() {
        numberPlayer?.currentTime = 0
        numberPlayer?.play()
    }
    
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
