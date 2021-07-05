//
//  AnimalView.swift
//  ReducLike
//
//  Created by Kim, Min Ho on 2021/06/06.
//

import SwiftUI

struct AnimalView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        VStack {
            Text(store.state.animal.current)
                .font(.system(.largeTitle))
                .padding()
            
            Button {
                loadAnimal()
            } label: {
                Text("Tap me")
            }
        }
        .onAppear {
            loadAnimal()
        }
    }
    
    private func loadAnimal() {
        store.dispatch(.animal(action: .fetch))
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}
