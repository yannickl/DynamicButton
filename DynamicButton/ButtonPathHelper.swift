//
//  DynamicButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 16/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

/// Create the line paths for each button styles.
internal class ButtonPathHelper {
  // MARK: - Representing the Button as Drawing Lines

  private class func createCircleWithRadius(center: CGPoint, radius: CGFloat) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, center.x + radius, center.y)
    CGPathAddArc(path, nil, center.x, center.y, radius, 0, 2 * CGFloat(M_PI), false)

    return path
  }

  private class func createLineWithRadius(center: CGPoint, radius: CGFloat, angle: CGFloat, offset: CGPoint = CGPointZero) -> CGPathRef {
    let path = CGPathCreateMutable()

    let c = cos(angle)
    let s = sin(angle)

    CGPathMoveToPoint(path, nil, center.x + offset.x + radius * c, center.y + offset.y + radius * s)
    CGPathAddLineToPoint(path, nil, center.x + offset.x - radius * c, center.y + offset.y - radius * s)

    return path
  }

  private class func createLineFromPoint(start: CGPoint, end: CGPoint, offset: CGPoint = CGPointZero) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, offset.x + start.x, offset.y + start.y)
    CGPathAddLineToPoint(path, nil, offset.x + end.x, offset.y + end.y)

    return path
  }

  class func pathForButtonWithStyle(style: DynamicButton.Style, withSize size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> (line1: CGPathRef, line2: CGPathRef, line3: CGPathRef, circlePath: CGPathRef, circleAlpha: Float) {
    let center = CGPoint(x: offset.x + size / 2, y: offset.y + size / 2)

    let line1Path: CGPathRef
    let line2Path: CGPathRef
    let line3Path: CGPathRef
    var circlePath: CGPathRef = ButtonPathHelper.createCircleWithRadius(center, radius: 0)
    var circleAlpha: Float    = 0

    switch style {
    case .ArrowLeft:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(lineWidth, size / 2), end: CGPointMake(size, size / 2))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(lineWidth, size / 2), end: CGPoint(x: size / 3.2, y: size / 2 + size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(lineWidth, size / 2), end: CGPoint(x: size / 3.2, y: size / 2 - size / 3.2))
    case .ArrowRight:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(0, size / 2), end: CGPointMake(size - lineWidth, size / 2))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(size - lineWidth, size / 2), end: CGPoint(x: size - size / 3.2, y: size / 2 + size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(size - lineWidth, size / 2), end: CGPoint(x: size - size / 3.2, y: size / 2 - size / 3.2))
    case .CaretDown:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(size / 6, 0))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(size / 6, 0))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(-size / 6, 0))
    case .CaretLeft:
      line1Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(0, size / 6))
      line2Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(0, size / 6))
      line3Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(0, -size / 6))
    case .CaretRight:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(0, size / 6))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(0, size / 6))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(0, -size / 6))
    case .CaretUp:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(size / 6, 0))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(size / 6, 0))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 4 - lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(-size / 6, 0))
    case .CheckMark:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: size / 4, y: size / 4), end: CGPoint(x: size / 2, y: size / 2), offset: CGPointMake(-size / 8, size / 4))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: size / 4, y: size / 4), end: CGPoint(x: size / 2, y: size - size / 2), offset: CGPointMake(-size / 8, size / 4))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: size / 2, y: size / 2), end: CGPoint(x: size, y: 0), offset: CGPointMake(-size / 8, size / 4))
    case .CircleClose:
      circlePath  = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2 - lineWidth)
      circleAlpha = 1
      line1Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: CGFloat(M_PI_4))
      line2Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: CGFloat(M_PI_4))
      line3Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: CGFloat(-M_PI_4))
    case .CirclePlus:
      circlePath  = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2 - lineWidth)
      circleAlpha = 1
      line1Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: CGFloat(M_PI_2))
      line2Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: CGFloat(M_PI_2))
      line3Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: 0)
    case .Close:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_4))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_4))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(-M_PI_4))
    case .Hamburger:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / -3.2))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / 3.2))
    case .HorizontalLine:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
    case .Pause:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2), offset: CGPoint(x: size / -4, y: 0))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2), offset: CGPoint(x: size / -4, y: 0))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2), offset: CGPoint(x: size / 4, y: 0))
    case .Plus:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
    case .VerticalLine:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2))
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2))
    }

    return (line1Path, line2Path, line3Path, circlePath, circleAlpha)
  }
}