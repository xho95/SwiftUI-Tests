//
//  Count_TimerApp.swift
//  Count Timer
//
//  Created by Kim, Min Ho on 2021/04/06.
//

import SwiftUI

@main
struct Count_TimerApp: App {
    @StateObject var timer = MyTimer()
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            MyTimerView().environmentObject(timer)
        }
    }
}
