//
//  Timers.swift
//  Timer
//
//  Created by Kim, Min Ho on 2021/07/25.
//

import SwiftUI

struct Timers: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            SimpleTimer()
                .tabItem { Image(systemName: "deskclock") }
                .tag(0)
            StopWatch()
                .tabItem { Image(systemName: "stopwatch") }
                .tag(1)
            IntervalStopWatch()
                .tabItem { Image(systemName: "timer") }
                .tag(2)
        }
    }
}

struct Timers_Previews: PreviewProvider {
    static var previews: some View {
        Timers()
    }
}
