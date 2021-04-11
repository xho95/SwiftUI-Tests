//
//  TouchableView.swift
//  MulitTouch
//
//  Created by Kim, Min Ho on 2021/04/11.
//

import SwiftUI

struct TouchableView: UIViewRepresentable {
    func makeUIView(context: Context) -> TouchableUIView {
        return TouchableUIView()
    }
    
    func updateUIView(_ uiView: TouchableUIView, context: Context) {
        //
    }
}

