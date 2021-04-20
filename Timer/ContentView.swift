//
//  ContentView.swift
//  Timer
//
//  Created by Kim, Min Ho on 2021/04/01.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    /*
    let timer = Timer
        .publish(every: 1, tolerance: 0.5, on: .main, in: .common)
        .autoconnect()
     */
    @State private var counter = 0
    @State private var date = Date()

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text("\(date)")
                .onReceive(timer) { time in
                    if self.counter == 10 {
                        self.timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }
                    
                    self.counter += 1
                    self.date = time
                }
                .padding()
            /*
            Text("\(Calendar.current.dateComponents([.hour, .minute, .second], from: date))")
                .onReceive(timer) { time in
                    if self.counter == 10 {
                        self.timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }
                    
                    self.counter += 1
                    self.date = time
                }
                .padding()
             */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
