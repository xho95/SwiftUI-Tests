//
//  ProtocolAndCombineApp.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import SwiftUI

@main
struct ProtocolAndCombineApp: App {
    let animal = Animal(generator: PersonGenerator())
    
    var body: some Scene {
        WindowGroup {
            AnimalView(animal: animal)
        }
    }
}
