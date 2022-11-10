//
//  FireworkParticle.swift
//  Particle
//
//  Created by Min Ho Kim on 2022/06/04.
//

import Foundation
import SwiftUI

struct FireworkParticles: GeometryEffect {
    var time: Double
    var speed = Double.random(in: 20...200)
    var Θ = Double.random(in: -Double.pi...Double.pi)
    
    var animatableData: Double {
        get { time }
        set { time = newValue }
    }
    
    // Apply the translation according to the time
    func effectValue(size: CGSize) -> ProjectionTransform {
        let xTranslation = speed * cos(Θ) * time
        let yTranslation = speed * sin(Θ) * time
        let affineTranslation = CGAffineTransform(translationX: xTranslation, y: yTranslation)
        
        return ProjectionTransform(affineTranslation)
    }
    
}
