//
//  AnimalMiddleware.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation
import Combine

enum AnimalMiddlewareError: Error {
    case unknown
    case networkError
}

func animalMiddleware(service: AnimalService) -> Middleware<State, Action> {
    { state, action in
        switch action {
        case .animal(action: .fetch):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { Action.animal(action: .fetchComplete(animal: $0)) }
                .replaceError(with: Action.animal(action: .fetchComplete(animal: "Oops!")))
                .eraseToAnyPublisher()
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
