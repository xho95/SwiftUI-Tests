//
//  ContentView.swift
//  MulitTouch
//
//  Created by Kim, Min Ho on 2021/04/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Hello, world!")
                .padding()
            TouchableView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
