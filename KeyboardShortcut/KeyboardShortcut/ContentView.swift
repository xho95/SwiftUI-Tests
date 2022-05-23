//
//  ContentView.swift
//  KeyboardShortcut
//
//  Created by Min Ho Kim on 2022/05/22.
//

import SwiftUI

struct ContentView: View {
    @State var isZeroOn: Bool = true
    @State var isEntered: Bool = true
    @State var isDeleted: Bool = true

    var body: some View {
        VStack {
            Text(keyInputs())
                .padding()

            Button {
                isZeroOn.toggle()
            } label: {
                Text("Toggle")
            }
            .keyboardShortcut(.init("0"), modifiers: [])

            Button {
                isEntered.toggle()
            } label: {
                Text("Toggle")
            }
            .keyboardShortcut(.return, modifiers: [])
        }
    }
    
    func keyInputs() -> String {
        let zero = isZeroOn ? "0, " : ""
        let enter = isEntered ? "Enter, " : ""
        let delete = isDeleted ? "Delete" : ""
        
        return "Key Inputs: " + zero + enter + delete
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
