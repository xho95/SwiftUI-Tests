//
//  SoundEngine.swift
//  SoundEffect
//
//  Created by Kim, Min Ho on 2022/02/06.
//

import Foundation
import AVKit

struct SoundEngine {
    private let engine: AVAudioEngine
    private let player: AVAudioPlayerNode

    private var audioFile: AVAudioFile

    init(fileName: String = "Number Key 01") {
        self.engine = AVAudioEngine()
        self.player = AVAudioPlayerNode()

        let effectURL = Bundle.main.url(forResource: fileName, withExtension: "m4a")!

        self.audioFile = try! AVAudioFile(forReading: effectURL)
        
        self.configureEngine()
    }
    
    func play() {
//        if player.isPlaying {
//            player.reset()
//        }
        player.scheduleFile(audioFile, at: nil)
        player.play()
    }

    private func configureEngine() {
        engine.attach(player)
        engine.connect(player, to: engine.outputNode, format: audioFile.processingFormat)
        engine.prepare()
        
        do {
            try engine.start()
        } catch {
            print("Error starting the player: \(error.localizedDescription)")
        }
    }
}
