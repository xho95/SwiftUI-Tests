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

extension EvenState {
    static func <- (lhs: inout EvenState, rhs: EvenState.Action) {
        lhs = lhs.reducer(lhs, rhs)
    }
}

let evenStateReducer: EvenStateReducer = { state, action in
    var mutatingState = state
    
    switch action {
    case .makeEven:
        mutatingState.isTrue = true
        print("- \(mutatingState.isTrue)")
    case .makeOdd:
        mutatingState.isTrue = false
        print("- \(mutatingState.isTrue)")
    }
    
    return mutatingState
}


