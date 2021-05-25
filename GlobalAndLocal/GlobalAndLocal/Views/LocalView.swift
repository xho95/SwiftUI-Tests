//
//  LocalView.swift
//  GlobalAndLocal
//
//  Created by Kim, Min Ho on 2021/05/25.
//

import SwiftUI

struct LocalView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.green)

                Line(direction: .horizontal)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary)

                Line(direction: .vertical)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.primary)
                
                TouchableView()
            }
        }

    }
}

struct LocalView_Previews: PreviewProvider {
    static var previews: some View {
        LocalView()
    }
}
