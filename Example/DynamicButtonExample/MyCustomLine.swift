//
//  CustomButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 31/03/2017.
//  Copyright © 2017 Yannick LORIOT. All rights reserved.
//

import UIKit

/// Diagonal line style: \
struct MyCustomLine: DynamicButtonBuildableStyle {
  let pathVector: DynamicButtonPathVector

  init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let r = size / 2
    let c = cos(CGFloat.pi * 0.3)
    let s = sin(CGFloat.pi * 0.3)

    let p1 = CGMutablePath()
    p1.move(to: CGPoint(x: center.x + r * c, y: center.y + r * s))
    p1.addLine(to: CGPoint(x: center.x - r * c, y: center.y - r * s))

    pathVector = DynamicButtonPathVector(p1: p1, p2: p1, p3: p1, p4: p1)
  }

  /// "MyCustomLine" style.
  static var styleName: String {
    return "MyCustomLine"
  }
}
