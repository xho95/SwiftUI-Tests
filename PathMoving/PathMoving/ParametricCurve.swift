//
//  ParametricCurve.swift
//  PathMoving
//
//  Created by Kim, Min Ho on 2021/02/20.
//

import SwiftUI
import Accelerate

protocol ParametricCurve {
    var totalArcLength: CGFloat { get }
    func point(t: CGFloat) -> CGPoint
    func derivate(t: CGFloat) -> CGVector
    func secondDerivate(t: CGFloat) -> CGVector
    func arcLength(t: CGFloat) -> CGFloat
    func curvature(t: CGFloat) -> CGFloat
}

extension ParametricCurve {
    func arcLength(t: CGFloat) -> CGFloat {
        var tMin: CGFloat = .zero
        var tMax: CGFloat = .zero
        
        if t < .zero {
            tMin = t
        } else {
            tMax = t
        }
        
        let quadrature = Quadrature(integrator: .qags(maxIntervals: 8), absoluteTolerance: 5.0e-2, relativeTolerance: 1.0e-3)
        let result = quadrature.integrate(over: Double(tMin)...Double(tMax)) { 𝜏 in
            let dp = derivate(t: CGFloat(𝜏))
            let ds = Double(hypot(dp.dx, dp.dy))
            return ds
        }
        
        switch result {
        case .success((let arcLength, _/*, let e*/)):
            return t < .zero ? -CGFloat(arcLength) : CGFloat(arcLength)
        case .failure(let error):
            print("integration error:", error.errorDescription)
            return CGFloat.nan
        }
    }
    
    func curveParameter(arcLength: CGFloat) -> CGFloat {
        let maxLength = totalArcLength == .zero ? self.arcLength(t: 1) : totalArcLength
        guard maxLength > 0 else { return 0 }
        
        var iteration = 0
        var guess: CGFloat = arcLength / maxLength
        
        let maxIterations = 10
        let maxError: CGFloat = 0.1
        
        while iteration < maxIterations {
            let error = self.arcLength(t: guess) - arcLength
            if abs(error) < maxError { break }
            let dp = derivate(t: guess)
            let m = hypot(dp.dx, dp.dy)
            guess -= error / m
            iteration += 1
        }
        
        return guess
    }
    
    func curvature(t: CGFloat) -> CGFloat {
        /*
                     x'y" - y'x"
         k(t) = --------------------
                 (x'² + y'²)^(3/2)
         */
        let dp = derivate(t: t)
        let dp2 = secondDerivate(t: t)
        let dpSize = hypot(dp.dx, dp.dy)
        let denominator = dpSize * dpSize * dpSize
        let nominator = dp.dx * dp2.dy - dp.dy * dp2.dx
        
        return nominator / denominator
    }
}
