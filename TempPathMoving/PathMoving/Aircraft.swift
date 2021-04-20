//
//  Aircraft.swift
//  PathMoving
//
//  Created by Kim, Min Ho on 2021/02/20.
//

import SwiftUI
import Combine

class Aircraft: ObservableObject {
    
    let track: ParametricCurve
    let path: Path
    
    init(from: CGPoint, to: CGPoint, control1: CGPoint, control2: CGPoint) {
        track = MyBezierCurve(from: from, to: to, control1: control1, control2: control2)
        
        path = Path { path in
            path.move(to: from)
            path.addCurve(to: to, control1: control1, control2: control2)
        }
    }

    @Published var alongTrackDistance = CGFloat.zero

    var aircraft: some View {
        let t = track.curveParameter(arcLength: alongTrackDistance)
        let p = track.point(t: t)
        let dp = track.derivate(t: t)
        let h = Angle(radians: atan2(Double(dp.dy), Double(dp.dx)))
        
        return Text("✈︎")
            .font(.largeTitle)
            .rotationEffect(h)
            .position(p)
    }

    @Published var flying = false

    var timer: Cancellable? = nil

    func fly() {
        flying = true
        timer = Timer
            .publish(every: 0.02, on: RunLoop.main, in: RunLoop.Mode.default)
            .autoconnect()
            .sink { _ in
                self.alongTrackDistance += self.track.totalArcLength / 200.0
                if self.alongTrackDistance > self.track.totalArcLength {
                    self.timer?.cancel()
                    self.flying = false
                }
            }
    }
}
