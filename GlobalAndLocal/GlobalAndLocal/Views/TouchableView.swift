//
//  TouchableView.swift
//  GlobalAndLocal
//
//  Created by Kim, Min Ho on 2021/05/25.
//

import SwiftUI

struct TouchableView: UIViewRepresentable {
    //@Binding var position: CGPoint
    
    func makeUIView(context: Context) -> UITouchableView {
        UITouchableView()
    }

    func updateUIView(_ uiView: UITouchableView, context: Context) {
        //
    }
/*
    var callback: () -> Void

    func makeCoordinator() -> Coordinator {
        Coordinator(callback: self.callback)
    }

    class Coordinator: NSObject {
        var callback: () -> CGPoint
        
        init(callback: @escaping () -> CGPoint) {
            self.callback = callback
        }
//
//        @objc func tapped(gesture:UITapGestureRecognizer) {
//            let point = gesture.location(in: gesture.view)
//            self.tappedCallback(point)
//        }
    }
*/
}
