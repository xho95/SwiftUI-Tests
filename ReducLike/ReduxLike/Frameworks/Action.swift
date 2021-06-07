//
//  Action.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

enum Action {
    case animal(action: AnimalAction)
}

enum AnimalAction {
    case fetchAnimal
    case setCurrentAnimal(animal: String)
}
