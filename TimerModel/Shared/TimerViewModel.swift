//
//  TimerViewModel.swift
//  TimerModel
//
//  Created by Kim, Min Ho on 2021/07/30.
//

import Foundation
import Combine

class TimerViewModel: ObservableObject {
    private var assignCancellable: AnyCancellable?
    
    @Published var tick: String = "0:0:0"
    
    init(assignCancellable: AnyCancellable? = nil) {
        self.assignCancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .map { String(describing: $0) }
            .assign(to: \.tick, on: self)
    }
}
