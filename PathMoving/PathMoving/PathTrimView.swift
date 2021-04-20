//
//  PathTrimView.swift
//  PathMoving
//
//  Created by Kim, Min Ho on 2021/02/20.
//

import SwiftUI

struct PathTrimView: View {
    @State var x: CGFloat = 0.0
    
    var body: some View {
        DrawingPath()
            .trim(from: 0, to: x)
            .stroke(lineWidth: 10)
            .frame(width: 200, height: 200)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 3).delay(0.5)) {
                    self.x = 1
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PathTrimView()
    }
}
