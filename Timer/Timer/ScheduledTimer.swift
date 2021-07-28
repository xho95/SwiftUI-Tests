//
//  ScheduledTimer.swift
//  Timer
//
//  Created by Kim, Min Ho on 2021/07/28.
//

import SwiftUI

struct ScheduledTimer: View {
    @State private var timeInterval = TimeInterval()
    @State private var currentInterval = TimeInterval()

    @State var isTimerRunning = false
    @State private var startTime =  Date()
    @State private var timerString = "0.0"
    @State private var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in }

    var body: some View {
        Text(timerString)
            .font(Font.system(.largeTitle, design: .monospaced))
            .onTapGesture {
                if isTimerRunning {
                    print("timeInterval: \(timeInterval)")
                    stopTimer()
                } else {
                    startTimer()
                }
                isTimerRunning.toggle()
            }
            .onAppear() {
                stopTimer()
            }
    }
    
    func stopTimer() {
        timer.invalidate()
        currentInterval = timeInterval
    }
    
    func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            timeInterval = currentInterval + Date().timeIntervalSince(startTime)
            timerString = String(format: "%.1f", timeInterval)
        }
    }
}

struct ScheduledTimer_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledTimer()
    }
}
