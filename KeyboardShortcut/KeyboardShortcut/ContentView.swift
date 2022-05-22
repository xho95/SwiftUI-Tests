//
//  ContentView.swift
//  KeyboardShortcut
//
//  Created by Min Ho Kim on 2022/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var isOn: Bool = true
    
    var body: some View {
        VStack {
            Text(isOn ? "Hello, world!" : "Hi")
                .padding()
            
            Button {
                isOn.toggle()
            } label: {
                Text("Toggle")
            }
            .keyboardShortcut("t")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
