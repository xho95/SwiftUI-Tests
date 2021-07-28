//
//  ScheduledTimer.swift
//  Timer
//
//  Created by Kim, Min Ho on 2021/07/28.
//

import SwiftUI

struct ScheduledTimer: View {
    @State private var newInterval = TimeInterval()
    @State private var oldInterval = TimeInterval()

    @State var isTimerRunning = false
    @State private var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in }

    var body: some View {
        VStack {
            Text(String(format: "%.0f", newInterval))
                .font(Font.system(.largeTitle, design: .monospaced))
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
        guard isTimerRunning == true else { return }
        
        timer.invalidate()
        print("timeInterval: \(newInterval)")
        oldInterval = newInterval

        isTimerRunning = false
    }
    
    func startTimer() {
        guard isTimerRunning == false else { return }

        let startTime = Date()

        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            newInterval = oldInterval + Date().timeIntervalSince(startTime)
        }

        isTimerRunning = true
    }
}

struct ScheduledTimer_Previews: PreviewProvider {
    static var previews: some View {
        ScheduledTimer()
    }
}
