//
//  MusicPlayer.swift
//  BackgroundMusic
//
//  Created by Kim, Min Ho on 2021/10/02.
//

import Foundation
import AVFoundation

class MusicPlayer {
    static let shared = MusicPlayer()

    var audioPlayer: AVAudioPlayer?
    
    func startMusic(fileName: String) {
        if let bundle = Bundle.main.path(forResource: fileName, ofType: "mp3") {
            let backgroundMusicURL = NSURL(fileURLWithPath: bundle)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusicURL as URL)
                
                guard let audioPlayer = audioPlayer else { return }

                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
    
    func stopMusic() {
        guard let audioPlayer = audioPlayer else { return }

        audioPlayer.stop()
    }
    
    func playSoundEffect(fileName: String) {
        if let bundle = Bundle.main.path(forResource: fileName, ofType: "mp3") {
            let soundEffectURL = NSURL(fileURLWithPath: bundle)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundEffectURL as URL)
                
                guard let audioPlayer = audioPlayer else { return }

                audioPlayer.play()
            } catch {
                print(error)
            }
        }
    }
}
