//
//  AnimalService.swift
//  ReduxLike
//
//  Created by Kim, Min Ho on 2021/06/07.
//

import Foundation
import Combine

struct AnimalService {
    func generateAnimalInTheFuture() -> AnyPublisher<String, Never> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Raccon"]
        let number = Double.random(in: 0..<5)
        
        return Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                let result = animals.randomElement() ?? ""
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()        
    }
}
