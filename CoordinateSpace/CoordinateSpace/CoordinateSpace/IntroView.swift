//
//  IntroView.swift
//  CoordinateSpace
//
//  Created by Kim, Min Ho on 2020/11/09.
//

import SwiftUI

struct IntroView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    NavigationLink(destination: CoordinatesValueView()) { Text("Coordinates Value") }
                    NavigationLink(destination: CoordinatesShapeView()) { Text("Coordinates Shape") }
                }
                .navigationBarHidden(true)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
