//
//  DynamicButtonStyleLocation.swift
//  DynamicButton
//
//  Created by VICTOR WENG on 2018-10-22.
//

import UIKit

/// Location symbol
struct DynamicButtonStyleLocation: DynamicButtonBuildableStyle {
    let pathVector: DynamicButtonPathVector
    
    init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
        let ratio = size/60
        let p3 = PathHelper.circle(atCenter: CGPoint(x:center.x, y:23*ratio), radius: size / 5 - lineWidth)
        
        let p1 = UIBezierPath()
        p1.move(to: CGPoint(x: 30*ratio, y: 1*ratio))
        p1.addCurve(to: CGPoint(x: 7.3*ratio, y: 23*ratio), controlPoint1: CGPoint(x: 17.5*ratio, y: 1*ratio), controlPoint2: CGPoint(x: 7.3*ratio, y: 10.4*ratio))
        p1.addCurve(to: CGPoint(x: 30*ratio, y: 60*ratio), controlPoint1: CGPoint(x: 7.3*ratio, y: 35.6*ratio), controlPoint2: CGPoint(x: 30*ratio, y: 60*ratio))
        p1.addCurve(to: CGPoint(x: 53.1*ratio, y: 23*ratio), controlPoint1: CGPoint(x: 30*ratio, y: 60*ratio), controlPoint2: CGPoint(x: 53.1*ratio, y: 35.7*ratio))
        p1.addCurve(to: CGPoint(x: 30*ratio, y: 1*ratio), controlPoint1: CGPoint(x: 53.1*ratio, y: 10.3*ratio), controlPoint2: CGPoint(x: 42.9*ratio, y: 1*ratio))
        p1.close()
        
        pathVector = DynamicButtonPathVector(p1: p3, p2: p3, p3: p3, p4: p1.cgPath)
    }
    
    /// "Location" style.
    static var styleName: String {
        return "Location"
    }
}
