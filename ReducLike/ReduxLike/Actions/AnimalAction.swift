//
//  AnimalAction.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation

enum AnimalAction {
    case fetch
    case fetchComplete(animal: String)
    case fetchError(error: AnimalMiddlewareError?)
}
