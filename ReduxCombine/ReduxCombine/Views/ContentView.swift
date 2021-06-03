//
//  ContentView.swift
//  ReduxCombine
//
//  Created by Kim, Min Ho on 2021/06/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Redux with Combine")
                .padding()

            Button {
                let store = Store()
                
                store.dispatch(action: .getPosts)
                store.dispatch(action: .getUsers)
                
                print(store.state)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    print(store.state)
                }
            } label: {
                Text("After 2 Seconds")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
