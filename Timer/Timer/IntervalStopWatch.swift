//
//  IntervalStopWatch.swift
//  Timer
//
//  Created by Kim, Min Ho on 2021/07/25.
//

import SwiftUI

struct IntervalStopWatch: View {
    @State private var timeInterval = TimeInterval()
    @State private var currentInterval = TimeInterval()

    @State var isTimerRunning = false
    @State private var startTime = Date()
    @State private var timerString = "0.0"
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(timerString)
                .font(Font.system(.largeTitle, design: .monospaced))
                .onReceive(timer) { _ in
                    if isTimerRunning {
                        timeInterval = currentInterval + Date().timeIntervalSince(startTime)
                        timerString = String(format: "%.1f", timeInterval)
                    }
                }
                .onTapGesture {
                    if isTimerRunning {
                        print("timeInterval: \(timeInterval)")
                        stopTimer()
                    } else {
                        //timerString = "0.00"
                        //print("currentInterval: \(currentInterval)")
                        startTimer()
                    }
                    isTimerRunning.toggle()
                }
                .onAppear() {
                    stopTimer()
                }
            
            Button {
                startTimer()
            } label: {
                Text("Start")
                    .padding()
            }
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
            
            Button {
                stopTimer()
            } label: {
                Text("Stop")
                    .padding()
            }
            .background(Color.yellow)
            .cornerRadius(10)
            .padding()
        }
    }
    
    func stopTimer() {
        timer.upstream.connect().cancel()
        currentInterval = timeInterval
    }
    
    func startTimer() {
        startTime = Date()
        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    }
}

struct IntervalStopWatch_Previews: PreviewProvider {
    static var previews: some View {
        IntervalStopWatch()
    }
}
