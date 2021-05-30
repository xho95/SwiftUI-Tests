//
//  UITouchableView.swift
//  GlobalAndLocal
//
//  Created by Kim, Min Ho on 2021/05/25.
//

import Foundation
import UIKit

class UITouchableView: UIView {
    var touchViews = [UITouch: TouchSpotView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isMultipleTouchEnabled = true
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        isMultipleTouchEnabled = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            createViewForTouch(touch: touch)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = viewForTouch(touch: touch)
            let newLocation = touch.location(in: self)
            view?.center = newLocation
            
            MyTouch.touches[touch] = newLocation
        }
        
        for touch in touchViews.keys {
            print("x: \(Int(touchViews[touch]?.center.x ?? .zero)), y: \(Int(touchViews[touch]?.center.y ?? .zero)) / ", terminator: "")
        }
        print("")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeViewForTouch(touch: touch)
            MyTouch.touches.removeValue(forKey: touch)
        }
    }
    
    func createViewForTouch(touch: UITouch) {
        let newView = TouchSpotView()
        newView.bounds = CGRect(x: 0, y: 0, width: 1, height: 1)
        newView.center = touch.location(in: self)
        
        addSubview(newView)
        UIView.animate(withDuration: 0.2) {
            newView.bounds.size = CGSize(width: 100, height: 100)
        }
        
        touchViews[touch] = newView
        
        MyTouch.touches[touch] = newView.center
    }
    
    func viewForTouch(touch: UITouch) -> TouchSpotView? {
        touchViews[touch]
    }
    
    func removeViewForTouch(touch: UITouch) {
        if let view = touchViews[touch] {
            view.removeFromSuperview()
            touchViews.removeValue(forKey: touch)
        }
    }
}

class TouchSpotView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    override var bounds: CGRect {
        get { super.bounds }
        set {
            super.bounds = newValue
            layer.cornerRadius = newValue.size.width / 2.0
        }
    }
}
