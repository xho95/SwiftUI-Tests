//
//  Reducer.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appReducer(state: inout State, action: Action) -> Void {
    switch action {
    case .animal(let action):
        animalReducer(state: &state.animal, action: action)
    }
}
