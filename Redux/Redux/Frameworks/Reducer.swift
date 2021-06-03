//
//  Reducer.swift
//  Redux
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import Foundation

func reducer(state: State, action: Action) -> State {
    var state = state
    
    switch action {
    case _ as IncrementAction:
        state.counter += 1
    default:
        break
    }
    
    return state
}
