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

  private class func createLineWithRadius(center: CGPoint, radius: CGFloat, angle: CGFloat, offset: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    let c = cos(angle)
    let s = sin(angle)

    CGPathMoveToPoint(path, nil, center.x + offset.x + radius * c, center.y + offset.y + radius * s)
    CGPathAddLineToPoint(path, nil, center.x + offset.x - radius * c, center.y + offset.y - radius * s)

    return path
  }

  private class func createLineFromPoint(start: CGPoint, end: CGPoint, offset: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, offset.x + start.x, offset.y + start.y)
    CGPathAddLineToPoint(path, nil, offset.x + end.x, offset.y + end.y)

    return path
  }

  class func pathForButtonWithStyle(style: DynamicButton.Style, withSize size: CGFloat, lineWidth: CGFloat, offset: CGPoint) -> (line1: CGPathRef, line2: CGPathRef, line3: CGPathRef, circlePath: CGPathRef, circleAlpha: Float) {
    let center = CGPoint(x: offset.x + size / 2, y: offset.y + size / 2)

    let line1Path: CGPathRef
    let line2Path: CGPathRef
    let line3Path: CGPathRef
    var circlePath: CGPathRef = ButtonPathHelper.createCircleWithRadius(center, radius: 0)
    var circleAlpha: Float    = 0

    switch style {
    case .ArrowLeft:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI), offset: CGPointZero)
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(0, size / 2), end: CGPointMake(size / 2 / 1.6, size / 2 + size / 2 / 1.6), offset: offset)
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(0, size / 2), end: CGPointMake(size / 2 / 1.6, size / 2 - size / 2 / 1.6), offset: offset)
    case .ArrowRight:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI), offset: CGPointZero)
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(size, size / 2), end: CGPointMake(size - size / 2 / 1.6, size / 2 + size / 2 / 1.6), offset: offset)
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(size, size / 2), end: CGPointMake(size - size / 2 / 1.6, size / 2 - size / 2 / 1.6), offset: offset)
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
    case .CircleClose:
      circlePath  = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2)
      circleAlpha = 1
      line1Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: CGFloat(M_PI_4), offset: CGPointZero)
      line2Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: CGFloat(M_PI_4), offset: CGPointZero)
      line3Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: CGFloat(-M_PI_4), offset: CGPointZero)
    case .CirclePlus:
      circlePath  = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2)
      circleAlpha = 1
      line1Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: CGFloat(M_PI_2), offset: CGPointZero)
      line2Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: CGFloat(M_PI_2), offset: CGPointZero)
      line3Path   = ButtonPathHelper.createLineWithRadius(center, radius: size / 2 / 1.6, angle: 0, offset: CGPointZero)
    case .Close:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_4), offset: CGPointZero)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_4), offset: CGPointZero)
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(-M_PI_4), offset: CGPointZero)
    case .Hamburger:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointZero)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / -2 / 1.6))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / 2 / 1.6))
    case .Plus:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2), offset: CGPointZero)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI_2), offset: CGPointZero)
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointZero)
    }

    return (line1Path, line2Path, line3Path, circlePath, circleAlpha)
  }
}