//
//  AnimalView.swift
//  ProtocolAndCombine
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import SwiftUI

struct AnimalView: View {
    @ObservedObject var animal: Animal
    
    var body: some View {
        VStack {
            Text(animal.textToShow)
                .font(.system(.largeTitle))
                .padding()

            Button {
                self.animal.generate()
            } label: {
                Text("Tap me")
            }
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView(animal: Animal(generator: AnimalGenerator()))
    }
}
