//
//  AnimalReducer.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation

func animalReducer(state: inout Animal, action: AnimalAction) -> Void {
    switch action {
    case .fetchAnimal:
        break
    case .setCurrentAnimal(let animal):
        state.current = animal
    }
}
