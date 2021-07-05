//
//  AnimalMiddleware.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation
import Combine

func animalMiddleware(service: AnimalService) -> Middleware<State, Action> {
    { state, action in
        switch action {
        case .animal(action: .fetchAnimal):
            return service.generateAnimalInTheFuture()
                .subscribe(on: DispatchQueue.main)
                .map { Action.animal(action: .setCurrentAnimal(animal: $0)) }
                .eraseToAnyPublisher()
        default:
            break
        }
        
        return Empty().eraseToAnyPublisher()
    }
}
