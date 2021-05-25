//
//  Line.swift
//  GlobalAndLocal
//
//  Created by Kim, Min Ho on 2021/05/25.
//

import SwiftUI

struct Line: Shape {
    var direction: Direction
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        switch direction {
        case .horizontal:
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        case .vertical:
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
        
        return path
    }
    
    enum Direction {
        case horizontal
        case vertical
    }
}
