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
    var evenState: EvenState
    
    let reducer: AppStateReducer
    
    init(number: Int = 0,
         evenState: EvenState = EvenState(),
         reducer: @escaping AppStateReducer = appStateReducer) {
        self.number = number
        self.evenState = evenState
        self.reducer = reducer
    }
    
    enum Action {
        case increase
        case decrease
    }
}

let appStateReducer: AppStateReducer = { state, action in
    var mutatingState = state
    
    switch action {
    case .increase:
        mutatingState.number += 1
        if mutatingState.number % 2 == 0 {
            mutatingState.evenState <- .makeEven
            //mutatingState.evenState = state.evenState.reducer(state.evenState, .makeEven)
        } else {
            mutatingState.evenState <- .makeOdd
            //mutatingState.evenState = state.evenState.reducer(state.evenState, .makeOdd)
        }
    case .decrease:
        mutatingState.number -= 1
        if mutatingState.number % 2 == 0 {
            mutatingState.evenState = mutatingState.evenState.reducer(mutatingState.evenState, .makeEven)
        } else {
            mutatingState.evenState = mutatingState.evenState.reducer(mutatingState.evenState, .makeOdd)
        }
    }
    
    return mutatingState
}
