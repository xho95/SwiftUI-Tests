//
//  AnimalReducer.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation

func animalReducer(state: inout Animal, action: AnimalAction) -> Void {
    switch action {
    case .fetch:
        state.fetchInProcess = true

    case .fetchComplete(let animal):
        state.fetchError = nil
        state.fetchInProcess = false
        state.current = animal
        
    case .fetchError(let error):
        state.fetchInProcess = false
        switch error {
        case .networkError:
            state.fetchError = "I'm sorry, but the server went away"
        default:
            state.fetchError = "Opps! It seems someone made a mistake!"
        }
    }
}
