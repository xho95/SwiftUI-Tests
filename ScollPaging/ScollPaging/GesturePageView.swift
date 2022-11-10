//
//  GesturePageView.swift
//  ScollPaging
//
//  Created by Min Ho Kim on 2022/11/10.
//

import SwiftUI

struct GesturePageView: View {
    let colors: [Color] = [.red, .green, .blue, .orange]
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(colors.indices, id: \.self) { index in
                colors[index]
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 400)
                    .cornerRadius(10)
            }
        }
        .horizontalScroll(items: colors.count, itemWidth: UIScreen.main.bounds.width * 0.8, itemSpacing: 10)
    }
}

struct GesturePageView_Previews: PreviewProvider {
    static var previews: some View {
        GesturePageView()
    }
}
