//
//  PathDrawing.swift
//  PathMoving
//
//  Created by Kim, Min Ho on 2021/02/20.
//

import SwiftUI

struct DrawingPath: Shape {
    func path(in rect: CGRect) -> Path {
        let path = Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addQuadCurve(to: CGPoint(x: 230, y: 200), control: CGPoint(x: -100, y: 300))
            path.addQuadCurve(to: CGPoint(x: 90, y: 400), control: CGPoint(x: 400, y: 130))
            path.addLine(to: CGPoint(x: 90, y: 600))
        }
        return path
    }
}
