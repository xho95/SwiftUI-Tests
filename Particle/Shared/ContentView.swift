//
//  ContentView.swift
//  Shared
//
//  Created by Min Ho Kim on 2022/06/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .modifier(ParticleModifier())
                .offset(x: -100, y: -50)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 12, height: 12)
                .modifier(ParticleModifier())
                .offset(x: 60, y: 70)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
