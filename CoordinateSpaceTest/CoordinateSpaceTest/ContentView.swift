//
//  ContentView.swift
//  CoordinateSpaceTest
//
//  Created by Kim, Min Ho on 2021/05/06.
//

import SwiftUI

// A sample code from the Apple's Developer Documentation
struct ContentView: View {
    @State var location = CGPoint.zero

    var body: some View {
        VStack {
            Color.red.frame(width: 100, height: 100)
                .overlay(circle)
            Text("Location: \(Int(location.x)), \(Int(location.y))")
        }
        .coordinateSpace(name: "stack")
    }

    var circle: some View {
        Circle()
            .frame(width: 25, height: 25)
            .gesture(drag)
            .padding(5)
    }

    var drag: some Gesture {
        DragGesture(coordinateSpace: .named("stack"))
            .onChanged { info in
                location = info.location
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
