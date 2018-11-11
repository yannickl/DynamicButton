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
        let p3 = PathHelper.circle(atCenter: CGPoint(x:offset.x+30*ratio, y:offset.y+23*ratio), radius: size / 5 - lineWidth)
        
        let p1 = UIBezierPath()
        p1.move(to: CGPoint(x: offset.x+30*ratio, y: offset.y+2.0*ratio))
        p1.addCurve(to: CGPoint(x: offset.x+7.3*ratio, y: offset.y+23*ratio), controlPoint1: CGPoint(x: offset.x+17.5*ratio, y: offset.y+2.0*ratio), controlPoint2: CGPoint(x: offset.x+7.3*ratio, y: offset.y+10.4*ratio))
        p1.addCurve(to: CGPoint(x: offset.x+30*ratio, y: offset.y+58.0*ratio), controlPoint1: CGPoint(x: offset.x+7.3*ratio, y: offset.y+35.6*ratio), controlPoint2: CGPoint(x: offset.x+30*ratio, y: offset.y+58.0*ratio))
        p1.addCurve(to: CGPoint(x: offset.x+53.1*ratio, y: offset.y+23*ratio), controlPoint1: CGPoint(x: offset.x+30*ratio, y: offset.y+58.0*ratio), controlPoint2: CGPoint(x: offset.x+53.1*ratio, y: offset.y+35.7*ratio))
        p1.addCurve(to: CGPoint(x: offset.x+30*ratio, y: offset.y+2.0*ratio), controlPoint1: CGPoint(x: offset.x+53.1*ratio, y: offset.y+10.3*ratio), controlPoint2: CGPoint(x: offset.x+42.9*ratio, y: offset.y+2.0*ratio))
        p1.close()
        
        pathVector = DynamicButtonPathVector(p1: p3, p2: p1.cgPath, p3: p3, p4: p3)
    }
    
    /// "Location" style.
    static var styleName: String {
        return "Location"
    }
}
