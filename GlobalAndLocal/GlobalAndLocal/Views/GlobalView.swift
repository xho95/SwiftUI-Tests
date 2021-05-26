//
//  GlobalView.swift
//  GlobalAndLocal
//
//  Created by Kim, Min Ho on 2021/05/25.
//

import SwiftUI

struct GlobalView: View {
    @State private var position = CGPoint.zero
        
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Line(direction: .horizontal)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary)

                Line(direction: .vertical)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary)

                LocalView(position: $position)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                    .rotationEffect(.degrees(30))
            }
            .overlay(
                VStack {
                    HStack {
                        Text("x: \(position.x), y: \(position.y)")
                            .padding()
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
            )
        }
    }
}

struct GlobalView_Previews: PreviewProvider {
    static var previews: some View {
        GlobalView()
    }
}
