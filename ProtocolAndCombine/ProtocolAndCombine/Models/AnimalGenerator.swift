//
//  AnimalGenerator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

class AnimalGenerator: ObservableObject {
    @Published private(set) var name: String = ""
    
    let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
    
    init() {
        generate()
    }
    
    func generate() {
        self.name = animals.randomElement() ?? ""
    }
}
