//
//  EvenState.swift
//  ReduxSelf (iOS)
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import Foundation

typealias EvenStateReducer = Reducer<EvenState, EvenState.Action>

struct EvenState: Statable {
    var isTrue: Bool
    
    let reducer: EvenStateReducer
    
    init(isTrue: Bool = true,
         reducer: @escaping EvenStateReducer = evenStateReducer) {
        self.isTrue = isTrue
        self.reducer = reducer
    }
    enum Action {
        case makeEven
        case makeOdd
    }
}

let evenStateReducer: EvenStateReducer = { state, action in
    var mutatingState = state
    
    switch action {
    case .makeEven:
        mutatingState.isTrue = true
    case .makeOdd:
        mutatingState.isTrue = false
    }
    
    return state
}


