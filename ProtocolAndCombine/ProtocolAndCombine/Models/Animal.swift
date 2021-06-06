//
//  AnimalGenerator.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import Foundation
import Combine

class Animal: ObservableObject {
    @Published var textToShow: String = "No data"
    
    var generator: Generator
    var cancellable: AnyCancellable?
    
    init(generator: Generator) {
        self.generator = generator
        
        cancellable = generator
            .namePublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] data in
                self?.textToShow = data
            }
    }
    
    func generate() {
        generator.generate()
    }
}
