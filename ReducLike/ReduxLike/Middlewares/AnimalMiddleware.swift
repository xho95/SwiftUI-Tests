//
//  AnimalMiddleware.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation
import Combine

//enum AnimalMiddlewareError: Error {
//    case unknown
//    case networkError
//}

func animalMiddleware(service: AnimalService) -> Middleware<State, Action> {
    { state, action in
        switch action {
        case .animal(action: .fetch):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { Action.animal(action: .fetchComplete(animal: $0)) }
                .catch { (error: AnimalServiceError) -> Just<Action> in
                    switch error {
                    case .unknown:
                        return Just(Action.animal(action: .fetchError(error: AnimalServiceError.unknown)))
                    case .networkError:
                        return Just(Action.animal(action: .fetchError(error: AnimalServiceError.networkError)))
                    }
                }
                .eraseToAnyPublisher()
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
