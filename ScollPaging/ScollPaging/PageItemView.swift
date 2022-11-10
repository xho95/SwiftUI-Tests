//
//  PageItemView.swift
//  ScollPaging
//
//  Created by Min Ho Kim on 2022/11/10.
//

import SwiftUI

struct PageItemView: View {
    var body: some View {
        TabView {
            ForEach(0..<10) { i in
                ZStack {
                    Color.black
                    Text("Row: \(i)").foregroundColor(.white)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            }
            .padding(.all, 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 200)
        .tabViewStyle(.page(indexDisplayMode: .never))
    }
}

struct PageItemView_Previews: PreviewProvider {
    static var previews: some View {
        PageItemView()
    }
}
