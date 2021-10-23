//
//  ContentView.swift
//  AVAudioEngine
//
//  Created by Kim, Min Ho on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var url: URL
    
    let player = AudioPlayer()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                player.setup(url: url)
            }
    }
}
