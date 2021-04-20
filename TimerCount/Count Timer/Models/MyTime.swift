//
//  Time.swift
//  Count Timer
//
//  Created by Kim, Min Ho on 2021/04/20.
//

import Foundation

struct MyTime {
    private(set) var hours: Int = 0
    private(set) var minutes: Int = 0
    private(set) var seconds: Int = 0
    private(set) var ten: Int = 0
    
    mutating func increase() {
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
    
    mutating func reset() {
        self.hours = 0
        self.minutes = 0
        self.seconds = 0
        self.ten = 0
    }
}
