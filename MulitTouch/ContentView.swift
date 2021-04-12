//
//  ContentView.swift
//  MulitTouch
//
//  Created by Kim, Min Ho on 2021/04/11.
//

import SwiftUI

struct ContentView: View {
    @State var zoomScale: CGFloat = 1.0
    @State var panOffset: CGSize = .zero
    
    @State var image = UIImage(named: "kf-21")!

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(uiImage: image)
                    .scaleEffect(zoomScale)
                    .offset(panOffset)
                    .onAppear {
                        zoomToFit(image, in: geometry.size)
                        
                        var location = CGPoint(x: image.size.width - geometry.size.width/2, y: image.size.height - geometry.size.height/2)
                        location = CGPoint(x: image.size.width - self.panOffset.width, y: image.size.height - self.panOffset.height)
                        location = CGPoint(x: image.size.width / self.zoomScale, y: image.size.height / self.zoomScale)
                    }
                    .onTapGesture(count: 2) {
                        zoomToFit(image, in: geometry.size)
                    }
                TouchableView()
            }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
