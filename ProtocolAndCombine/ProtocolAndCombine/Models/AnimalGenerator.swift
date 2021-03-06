//
//  AnimalGenerator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

class AnimalGenerator: ObservableObject, Generator {
    @Published private(set) var name: String = ""
    
    var namePublished: Published<String> { _name }
    var namePublisher: Published<String>.Publisher { $name }
    
    let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
    
    init() {
        generate()
    }
    
    func generate() {
        self.name = animals.randomElement() ?? ""
    }
}
