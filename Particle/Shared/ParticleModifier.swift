//
//  ParticleModifier.swift
//  Particle
//
//  Created by Min Ho Kim on 2022/06/04.
//

import SwiftUI

struct ParticleModifier: ViewModifier {
    @State var time = 0.0
    @State var scale = 0.1
    
    let duration = 5.0
    
    func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<100, id: \.self) { index in
                content
                    .hueRotation(Angle(degrees: time * 80))
                    .scaleEffect(scale)
                    .modifier(FireworkParticles(time: time))
                    .opacity((duration - time) / duration)
            }
        }
        .onAppear {
            // Here's the point at which the time and the scale chages.
            // time: 0.0 --> duration
            // sclae: 0.1 --> 1.0
            withAnimation(.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
    }
}
