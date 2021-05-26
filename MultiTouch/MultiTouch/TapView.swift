//
//  TapView.swift
//  MultiTouch
//
//  Created by Kim, Min Ho on 2021/05/26.
//

// https://stackoverflow.com/questions/61566929/swiftui-multitouch-gesture-multiple-gestures

import SwiftUI

struct TapView: UIViewRepresentable {
    var tappedCallback: () -> Void

    func makeUIView(context: UIViewRepresentableContext<TapView>) -> TapView.UIViewType {
        let view = UIView(frame: .zero)
        let gesture = NFingerGestureRecognizer(target: context.coordinator,
                                               action: #selector(Coordinator.tapped))
        view.addGestureRecognizer(gesture)
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<TapView>) {
        //
    }

    func makeCoordinator() -> TapView.Coordinator {
        Coordinator(tappedCallback:self.tappedCallback)
    }

    class Coordinator: NSObject {
        var tappedCallback: () -> Void

        init(tappedCallback: @escaping () -> Void) {
            self.tappedCallback = tappedCallback
        }

        @objc func tapped(gesture: NFingerGestureRecognizer) {
            for touch in 0..<gesture.numberOfTouches{
                print(gesture.location(ofTouch: touch, in: gesture.view))
            }
            self.tappedCallback()
        }
    }
}
