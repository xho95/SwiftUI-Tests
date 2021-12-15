//
//  ContentView.swift
//  LandscapeMode
//
//  Created by Kim, Min Ho on 2021/12/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.yellow)
            
            Text("Hello, world!")
                .padding()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
