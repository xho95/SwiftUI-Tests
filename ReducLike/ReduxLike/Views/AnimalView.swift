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
            Text(store.state.currentAnimal)
                .font(.system(.largeTitle))
                .padding()
            
            Button {
                store.dispatch(.getAnimal)
            } label: {
                Text("Tap me")
            }
        }
        .onAppear {
            store.dispatch(.getAnimal)
        }
    }
}

struct AnimalView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalView()
    }
}
