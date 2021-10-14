//
//  ContentView.swift
//  AudioPlayer
//
//  Created by Kim, Min Ho on 2021/10/02.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        ZStack {
            VStack {
                Text("Play")
                    .font(.system(size: 45))
                    .font(.largeTitle)
                
                HStack {
                    Spacer()
                    
                    Button {
                        self.audioPlayer.play()
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Spacer()
                    
                    Button {
                        self.audioPlayer.pause()
                    } label: {
                        Image(systemName: "pause.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fit)
                    }
                    
                    Spacer()
                }
            }
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "Battle_Ground", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            self.audioPlayer.numberOfLoops = -1
            
            self.setAudioSession()
        }
    }
    
    func setAudioSession() {
        // Get the singleton instance.
        let audioSession = AVAudioSession.sharedInstance()
        do {
            // Set the audio session category, mode, and options.
            try audioSession.setCategory(.playback, mode: .default, options: [.mixWithOthers, .allowAirPlay])
            print("Playback OK")
            try audioSession.setActive(true)
            print("Session is Active")
        } catch {
            print("Failed to set audio session category.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
