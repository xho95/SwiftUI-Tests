//
//  ContentView.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/07/30.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: TimerViewModel
    
    @State private var currentTime: String = ""
    
    var body: some View {
        VStack {
            Text(currentTime)
            Text(viewModel.tick)
        }
        .onReceive(
            Timer.publish(every: 0.9, on: .main, in: .default).autoconnect()
        ) {
            self.currentTime = String(describing: $0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
