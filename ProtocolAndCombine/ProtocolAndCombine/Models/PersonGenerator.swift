//
//  PersonGenerator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation

class PersonGenerator: ObservableObject, Generator {
    var namePublished: Published<String> { _name }
    var namePublisher: Published<String>.Publisher { $name }
    
    @Published private(set) var name: String = ""
    
    let people = ["Jone", "Jane", "Carlos", "Daniel", "Helen", "David", "Bill"]
    
    init() {
        generate()
    }
    
    func generate() {
        self.name = people.randomElement() ?? ""
    }
}
