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

func animalReducer(state: inout Animal, action: AnimalAction) -> Void {
    switch action {
    case .fetchAnimal:
        break
    case .setCurrentAnimal(let animal):
        state.current = animal
    }
}
