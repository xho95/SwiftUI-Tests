//
//  AudioPlayer.swift
//  AVAudioEngineTest
//
//  Created by Kim, Min Ho on 2021/10/20.
//

import Foundation
import AVFoundation

class TestAudioPlayer {
    var engine: AVAudioEngine!
    var player: AVAudioPlayerNode!
    
    func setup(url: URL) {
        engine = AVAudioEngine()
        player = AVAudioPlayerNode()
        
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        
        guard let file = try? AVAudioFile(forReading: url) else { fatalError("Couldn't read file") }
        
        guard let buffer = AVAudioPCMBuffer(pcmFormat: file.processingFormat, frameCapacity: AVAudioFrameCount(file.length)) else { fatalError("Couldn't create buffer") }
        
        try? file.read(into: buffer)
        
        print("\(buffer.format.channelCount)")

        player.scheduleBuffer(buffer, at: nil, options: [.loops])

        let distortion = AVAudioUnitDistortion()
        distortion.loadFactoryPreset(.drumsBitBrush)
        
        engine.attach(player)
        engine.attach(distortion)

//        engine.connect(player, to: engine.mainMixerNode, format: buffer.format)
        engine.connect(player, to: distortion, format: buffer.format)
        engine.connect(distortion, to: engine.mainMixerNode, format: buffer.format)
        
        engine.prepare()
        
        try? engine.start()
        
        player.play()
    }
    
}
