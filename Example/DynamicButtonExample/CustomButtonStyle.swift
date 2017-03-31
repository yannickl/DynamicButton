//
//  CustomButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 31/03/2017.
//  Copyright © 2017 Yannick LORIOT. All rights reserved.
//

import UIKit

/// Leftwards arrow style: ←
public struct DynamicButtonStyleCustom: Style, DynamicButtonBuildable {
  public let pathVector: DynamicButtonPathVector

  public func build(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> DynamicButtonBuildable {
    return DynamicButtonStyleCustom(center: center, size: size, offset: offset, lineWidth: lineWidth)
  }

  public init() {
    pathVector = .zero
  }

  public init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let rightPoint  = CGPoint(x: offset.x + size, y: center.y)
    let headPoint   = CGPoint(x: offset.x + lineWidth, y: center.y)
    let topPoint    = CGPoint(x: offset.x + size / 3.2, y: center.y + size / 3.2)
    let bottomPoint = CGPoint(x: offset.x + size / 3.2, y: center.y - size / 3.2)

    let p1 = PathHelper.line(from: rightPoint, to: headPoint)
    let p2 = PathHelper.line(from: headPoint, to: topPoint)
    let p3 = PathHelper.line(from: headPoint, to: bottomPoint)

    pathVector = DynamicButtonPathVector(p1: p1, p2: p2, p3: p3, p4: p1)
  }

  /// "Arrow Left" style.
  public static var styleName: String {
    return "Custom"
  }
}
