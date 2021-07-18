//
//  State.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import Foundation

typealias AppStateReducer = Reducer<AppState, AppState.Action>

struct AppState: Statable {
    var number: Int
    var even: Even
    
    let reducer: AppStateReducer
    
    init(number: Int = 0,
         reducer: @escaping AppStateReducer) {
        self.number = number
        self.reducer = { [self] action in
            var mutatingState = self

            switch action {
            case increase:
                mutatingState.number += 1
            case .decrease:
                mutatingState.number -= 1
            }
            
            return mutatingState
        }
    }
    
    enum Action {
        case increase
        case decrease
    }
}
