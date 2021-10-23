//
//  ContentView.swift
//  AVAudioEngineTest
//
//  Created by Kim, Min Ho on 2021/10/20.
//

import SwiftUI

struct ContentView: View {
    let url: URL
    
    init() {
        url = Bundle.main.url(forResource: "QuickSwishTrim", withExtension: "m4a")!
    }

    var body: some View {
        Button {
            let player = TestAudioPlayer()
            player.setup(url: url)
        } label: {
            Text("Hello, world!")
                .padding()
        }
    }
}
