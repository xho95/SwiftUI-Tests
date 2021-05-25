//
//  ContentView.swift
//  CoordinateSpace
//
//  Created by Kim, Min Ho on 2020/11/09.
//

import SwiftUI

struct CoordinatesValueView: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
            .ignoresSafeArea()
    }
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    @State private var globalCenter = CGPoint.zero
    @State private var customCenter = CGPoint.zero
    @State private var localCenter = CGPoint.zero

    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                VStack {
                    Text("Center")
                        .padding()
                        .background(Color.blue)
                    
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: 250, height: 250, alignment: .center)
                        .onTapGesture {
                            globalCenter = CGPoint(x: geo.frame(in: .global).midX,
                                                   y: geo.frame(in: .global).midY)
                            customCenter = CGPoint(x: geo.frame(in: .named("Custom")).midX,
                                                   y: geo.frame(in: .named("Custom")).midY)
                            localCenter = CGPoint(x: geo.frame(in: .local).midX,
                                                  y: geo.frame(in: .local).midY)
                        }
                    
                    Text("Global center: \(globalCenter.x) x \(globalCenter.y)")
                    Text("Custom center: \(customCenter.x) x \(customCenter.y)")
                    Text("Local center: \(localCenter.x) x \(localCenter.y)")
                }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesValueView()
    }
}
