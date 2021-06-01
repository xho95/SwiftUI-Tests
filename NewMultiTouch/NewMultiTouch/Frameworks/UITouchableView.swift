//
//  TouchableUIView.swift
//  MulitTouch
//
//  Created by Kim, Min Ho on 2021/04/11.
//

import Foundation
import UIKit

class UITouchableView: UIView {
//    enum Finger {
//        case one, two
//    }
//
//    var fingers: Finger = .one
    
    class TouchPoint {
        var origin: CGPoint?
        var new: CGPoint?
        
        init(origin: CGPoint) {
            self.origin = origin
        }
    }
    
    var origins = [CGPoint]()
    var news = [CGPoint]()
    
    var touchPoints = [UITouch: TouchPoint]()

    var touchViews = [UITouch: TouchSpotView]()
    var imageView = UIImageView()
    
    var moveTransform = CGAffineTransform.identity
    var reverseTransform = CGAffineTransform.identity

    var oldTransform = CGAffineTransform.identity
    var myTransform = CGAffineTransform.identity
    
    var imageTransform = CGAffineTransform.identity
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
        
        let image = UIImage(named: "kf-21")!
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        imageView.center = CGPoint(x: 0, y: 0)
        //imageView.transform = myTransform
        
        addSubview(imageView)

//        oldTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: frame.midX, ty: frame.midY)
//        imageView.transform = oldTransform
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isMultipleTouchEnabled = true
    }

    override func layoutSubviews() {
        imageView.center = CGPoint(x: frame.midX, y: frame.midY)

        super.layoutSubviews()
        
        moveTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: frame.midX, ty: frame.midY)
        reverseTransform = CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: -frame.midX, ty: -frame.midY)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            //createViewForTouch(touch: touch)
            
            let originLocation = touch.location(in: self)

            //originLocation.applying(oldTransform)
            touchPoints[touch] = TouchPoint(origin: originLocation)

//            if let globalOrigin = self.superview?.convert(originLocation, to: nil) {
//                globalOrigin.applying(oldTransform)
//                //origins.append(globalOrigin)
//
//                touchPoints[touch] = TouchPoint(origin: globalOrigin, new: .zero)
//            }
        }

        //imageView.transform = oldTransform
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = viewForTouch(touch: touch)
            let newLocation = touch.location(in: self)
            view?.center = newLocation
            
            if let touch = touchPoints[touch] {
                //newLocation.applying(oldTransform)
                touch.new = newLocation
            }

//            if let globalNew = self.superview?.convert(newLocation, to: nil) {
//                globalNew.applying(oldTransform)
//                //news.append(globalNew)
//
//                if let touch = touchPoints[touch] {
//                    touch.new = globalNew
//                }
//            }
        }
        
        if touchPoints.count == 2 {
            for touch in touchPoints.keys {
                if let origin = touchPoints[touch]!.origin {
                    origins.append(origin)
                }
                if let new = touchPoints[touch]!.new {
                    news.append(new)
                }
            }

            if origins.count == 2 && news.count == origins.count {
                let newTransform = similarityTransform(origins: origins, news: news)
                //myTransform = newTransform
                //myTransform = oldTransform.concatenating(newTransform)
                
                imageTransform = oldTransform.concatenating(newTransform)
                myTransform = moveTransform.concatenating(imageTransform).concatenating(reverseTransform)
                imageView.transform = myTransform
            }
        }
        /*
        if origins.count == 2 && originnews.count == 2 {
            let newTransform = similarityTransform(origins: origins, news: news)
            //myTransform = newTransform
            myTransform = oldTransform.concatenating(newTransform)
            imageView.transform = myTransform
            
            //oldTransform = myTransform
//            if let origin = origins.first, let new = news.first {
//                print("(\(origin.x), \(origin.y)) -> (\(new.x), \(new.y)")
//            }
//            print("\(CGAffineTransform.identity.tx), \(CGAffineTransform.identity.ty) -> \(newTransform.tx), \(newTransform.ty)")
        }
        */
        //print("(\(origins.first?.x ?? 0), \(origins.first?.y ?? 0)) -> (\(news.first?.x ?? 0), \(news.first?.y ?? 0)")
        
        //touchPoints.removeAll()

        origins.removeAll()
        news.removeAll()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            removeViewForTouch(touch: touch)
            
            touchPoints.removeValue(forKey: touch)
        }
        
        oldTransform = imageTransform
        
//        print(myTransform)
//        print(CGAffineTransform.identity)

        //origins.removeAll()
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
    }
    
    func viewForTouch(touch: UITouch) -> TouchSpotView? {
        return touchViews[touch]
    }
    
    func removeViewForTouch(touch: UITouch) {
        if let view = touchViews[touch] {
            view.removeFromSuperview()
            touchViews.removeValue(forKey: touch)
        }
    }
    
    func similarityTransform(origins: [CGPoint], news: [CGPoint]) -> CGAffineTransform {
        let originDx: CGFloat = origins[0].x - origins[1].x
        let originDy: CGFloat = origins[0].y - origins[1].y
        let originDistance: CGFloat = sqrt(pow(originDx, 2) + pow(originDy, 2))

        let newDx: CGFloat = news[0].x - news[1].x
        let newDy: CGFloat = news[0].y - news[1].y
        let newDistance: CGFloat = sqrt(pow(newDx, 2) + pow(newDy, 2))

        let scale: CGFloat = newDistance / originDistance
        let angle = atan2(newDy, newDx) - atan2(originDy, originDx)
        
        let a: CGFloat = cos(angle) * scale
        let b: CGFloat = sin(angle) * scale
        let c: CGFloat = -b
        let d: CGFloat = a
        // tx = x1' - a.x1 + b.y1 = x2' - a.x2 + b.y2
        // tx = ((x1' - a.x1 + b.y1) + (x2' - a.x2 + b.y2)) / 2
        // tx = x1' - a.x1 - b.y1 = x2' - a.x2 - b.y2
        // tx = ((x1' - a.x1 - b.y1) + (x2' - a.x2 - b.y2)) / 2
        let tx: CGFloat = ((news[0].x - a * origins[0].x + b * origins[0].y) + (news[1].x - a * origins[1].x + b * origins[1].y)) / 2.0
        // let tx: CGFloat = (news[0].x - a * origins[0].x - b * origins[0].y)
        // ty = y1' - b.x1 - a.y1 = y2' - b.x2 - a.y2
        // ty = ((y1' - b.x1 - a.y1) + (y2' - b.x2 - a.y2)) / 2
        let ty: CGFloat = ((news[0].y - b * origins[0].x - a * origins[0].y) + (news[1].y - b * origins[1].x - a * origins[1].y)) / 2.0
        
        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }

    func centeredPoint(point: CGPoint) -> CGPoint {
        CGPoint(x: point.x - frame.midX, y: point.y - frame.midY)
    }
}

class TouchSpotView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var bounds: CGRect {
        get { return super.bounds }
        set {
            super.bounds = newValue
            layer.cornerRadius = newValue.size.width / 2.0
        }
    }
}
