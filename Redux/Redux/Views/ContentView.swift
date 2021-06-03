//
//  ContentView.swift
//  Redux
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
        VStack {
            Text("\(store.state.counter)")
                .padding()
            
            Button("Increment") {
                store.dispatch(action: IncrementAction())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var store = Store(reducer: reducer)

    static var previews: some View {
        ContentView()
            .environmentObject(store)
    }
}
