//
//  MyTimerView.swift
//  Count Timer
//
//  Created by Kim, Min Ho on 2021/04/20.
//

import SwiftUI

struct MyTimerView: View {
    @EnvironmentObject var timer: MyTimer
    
    var body: some View {
        VStack {
            Text(String(format: "%02d:%02d:%02d.%1d", timer.time.hours, timer.time.minutes, timer.time.seconds, timer.time.ten))
                .font(Font.system(size: fontSize, design: .monospaced))
            if timer.timerIsPaused {
                HStack {
                    Button {
                        timer.resetTimer()
                        print("RESTART")
                    } label: {
                        Image(systemName: "backward.end.alt")
                            .padding(.all)
                    }
                    .padding(.all)
                    Button {
                        timer.startTimer()
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
                    timer.stopTimer()
                } label: {
                    Image(systemName: "stop.fill")
                        .padding(.all)
                }
                .padding(.all)
            }
        }
    }
    
    private let fontSize: CGFloat = 25
}

struct MyTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MyTimerView()
    }
}
