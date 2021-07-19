//
//  ContentView.swift
//  Shared
//
//  Created by Kim, Min Ho on 2021/07/18.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ReduxOperatorStore
    var body: some View {
        Text("\(store.state.number), \(store.state.evenState.isTrue ? "Even" : "Odd")")
            .padding()

        Button("Increase") {
            store.dispatch(.increase)
        }
        .padding()
        .background(Color.yellow)
        .padding()
        
        Button("Increase") {
            store.dispatch(.decrease)
        }
        .padding()
        .background(Color.red)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
