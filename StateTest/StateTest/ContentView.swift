//
//  ContentView.swift
//  StateTest
//
//  Created by Min Ho Kim on 2022/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var state: StructState = StructState()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
