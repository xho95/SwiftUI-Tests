//
//  AnimalGenerator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation
import Combine

class Animal: ObservableObject {
    @Published var displayData: String = "No data"
    
    var generator: AnimalGenerator = AnimalGenerator()
    var cancellable: AnyCancellable?
    
    init() {
        cancellable = generator
            .$name
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                self?.displayData = data
            }
    }
    
    func generate() {
        generator.generate()
    }
}
