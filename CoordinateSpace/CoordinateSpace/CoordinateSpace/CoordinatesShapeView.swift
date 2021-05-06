//
//  CoordinatesRectangleView.swift
//  CoordinateSpace
//
//  Created by Kim, Min Ho on 2020/11/09.
//

import SwiftUI

struct CoordinatesShapeView: View {
    var body: some View {
        OuterShape()
            .coordinateSpace(name: "Custom")
            .ignoresSafeArea()
    }
}

struct OuterShape: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.white)
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.red)
            VStack {
                Text("Top").foregroundColor(Color.black)
                InnerShape()
                Text("Bottom").foregroundColor(Color.black)
            }
        }
    }
}

struct InnerShape: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.white)
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.green)
            HStack {
                Text("Left").foregroundColor(Color.black)
                GeometryReader { geo in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color.white)
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3).foregroundColor(Color.blue)
                        Text("Center").foregroundColor(Color.black)
                    }
                }
                Text("Right").foregroundColor(Color.black)
            }
        }
    }
}

struct CoordinatesRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatesShapeView()
    }
}
