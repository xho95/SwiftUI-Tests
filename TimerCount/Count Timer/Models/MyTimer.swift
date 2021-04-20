//
//  MyTimer.swift
//  Count Timer
//
//  Created by Kim, Min Ho on 2021/04/20.
//

import Foundation

class MyTimer: ObservableObject {
    @Published var time = MyTime()
    
    @Published var timerIsPaused: Bool = true

    private var timer: Timer?
    
    func startTimer() {
        timerIsPaused = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            self.time.increase()
        }
    }
    
    func stopTimer() {
        timerIsPaused = true
        
        timer?.invalidate()
        timer = nil
    }
    
    func resetTimer() {
        self.time.reset()
    }
}
