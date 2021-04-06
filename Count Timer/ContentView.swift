//
//  ContentView.swift
//  Count Timer
//
//  Created by Kim, Min Ho on 2021/04/06.
//

import SwiftUI

struct ContentView: View {
    @State var hours: Int = 0
    @State var minutes: Int = 0
    @State var seconds: Int = 0
    @State var ten: Int = 0
    @State var timerIsPaused: Bool = true
    
    @State var timer: Timer?

    var body: some View {
        VStack {
            Text(String(format: "%02d:%02d:%02d.%1d", hours, minutes, seconds, ten))
                .font(Font.system(size: fontSize, design: .monospaced))
            if timerIsPaused {
                HStack {
                    Button {
                        self.restartTimer()
                        print("RESTART")
                    } label: {
                        Image(systemName: "backward.end.alt")
                            .padding(.all)
                    }
                    .padding(.all)
                    Button {
                        self.startTimer()
                        print("START")
                    } label: {
                        Image(systemName: "play.fill")
                            .padding(.all)
                    }
                    .padding(.all)
                }
            } else {
                Button {
                    print("STOP")
                    self.stopTimer()
                } label: {
                    Image(systemName: "stop.fill")
                        .padding(.all)
                }
                .padding(.all)
            }
        }
    }
    
    func startTimer() {
        timerIsPaused = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { time in
            if self.ten == 9 {
                self.ten = 0
                if self.seconds == 59 {
                    self.seconds = 0
                    if self.minutes == 59 {
                        self.minutes = 0
                        self.hours += 1
                    } else {
                        self.minutes += 1
                    }
                } else {
                    self.seconds += 1
                }
            } else {
                self.ten += 1
            }
        }
    }
    
    func stopTimer() {
        timerIsPaused = true
        timer?.invalidate()
        timer = nil
    }
    
    func restartTimer() {
        hours = 0
        minutes = 0
        seconds = 0
        ten = 0
    }
    
    private let fontSize: CGFloat = 25
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
