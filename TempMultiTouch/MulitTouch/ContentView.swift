//
//  ContentView.swift
//  MulitTouch
//
//  Created by Kim, Min Ho on 2021/04/11.
//

import SwiftUI

struct ContentView: View {
    @State private var zoomScale: CGFloat = 1.0
    @State private var panOffset: CGSize = .zero
    
    @State private var image = UIImage(named: "kf-21")!
    
    let touchableView = TouchableView()

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                touchableView
            }
            /*
            ZStack {
                ScrollView([.horizontal, .vertical], showsIndicators: false) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: scaledSize.width, height: scaledSize.height)
                }
                TouchableView()
            }
            .onAppear {
                zoomToFit(image, in: geometry.size)
            }
            .onTapGesture(count: 2) {
                zoomToFit(image, in: geometry.size)
            }*/
            /*
            .onRotate { newOrientation in
                zoomToFit(image, in: geometry.size)
            }*/
        }
    }
    
    private func zoomToFit(_ image: UIImage?, in size: CGSize) {
        if let image = image, image.size.width > 0, image.size.height > 0, size.height > 0, size.width > 0 {
            let hZoom = size.width / image.size.width
            let vZoom = size.height / image.size.height
            self.panOffset = .zero
            self.zoomScale = min(hZoom, vZoom)
        }
    }
    
    private var scaledSize: CGSize {
        CGSize(width: image.size.width * zoomScale, height: image.size.height * zoomScale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
