//
//  NFingerGestureRecognizer.swift
//  MultiTouch
//
//  Created by Kim, Min Ho on 2021/05/26.
//

import SwiftUI

class NFingerGestureRecognizer: UIGestureRecognizer {
    var touchViews = [UITouch:CGPoint]()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            let location = touch.location(in: touch.view)
            print("Start: (\(location.x)/\(location.y))")
            touchViews[touch] = location
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            let oldLocation = touchViews[touch]!
            let newLocation = touch.location(in: touch.view)
            touchViews[touch] = newLocation
            print("Move: (\(oldLocation.x)/\(oldLocation.y)) -> (\(newLocation.x)/\(newLocation.y))")
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        for touch in touches {
            let oldLocation = touchViews[touch]!
            touchViews.removeValue(forKey: touch)
            print("End: (\(oldLocation.x)/\(oldLocation.y))")
        }
    }
}
