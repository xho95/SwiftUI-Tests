//
//  ContentView.swift
//  MultiGesture
//
//  Created by Kim, Min Ho on 2021/05/26.
//


// https://stackoverflow.com/questions/56513942/how-to-detect-a-tap-gesture-location-in-swiftui

import SwiftUI

struct ContentView: View {
    @State var points: [CGPoint] = [
        CGPoint(x:0, y:0),
        CGPoint(x:50,y:50)
    ]
    
    var body: some View {
        ZStack {
            Color.gray
                .onClickGesture { point in
                    points.append(point)
                    print(point)
                }
            
            ForEach(points, id: \.debugDescription) { point in
                Color.red
                    .frame(width:50, height:50, alignment: .center)
                    .offset(CGSize(width: point.x, height: point.y))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
