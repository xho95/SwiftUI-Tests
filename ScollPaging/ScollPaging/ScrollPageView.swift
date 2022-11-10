//
//  ScrollPageView.swift
//  ScollPaging
//
//  Created by Min Ho Kim on 2022/11/10.
//

import SwiftUI

struct ScrollPageView: View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(colors.indices, id: \.self) { index in
                        Circle()
                            .fill(colors[index])
                            .overlay(Text("Page \(index)"))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
                    .padding()
                }
            }
            .onAppear { UIScrollView.appearance().isPagingEnabled = true }
        }
    }
}

struct ScrollPageView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollPageView()
    }
}
