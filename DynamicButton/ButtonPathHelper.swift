//
//  DynamicButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 16/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

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
    CGPathAddLineToPoint(path, nil, offset.x + start.x, offset.y + start.y)
    
    return path
  }

  class func pathForButtonWithStyle(style: DynamicButton.Style, atCenter center: CGPoint, withSize size: CGFloat, lineWidth: CGFloat, offset: CGPoint) -> (line1: CGPathRef, line2: CGPathRef, line3: CGPathRef, circlePath: CGPathRef, circleAlpha: Float, line1Alpha: Float) {
    var line1Path: CGPathRef  = ButtonPathHelper.createLineWithRadius(CGPointZero, radius: 0, angle: 0, offset: CGPointZero)
    let line2Path: CGPathRef
    let line3Path: CGPathRef
    var circlePath: CGPathRef = ButtonPathHelper.createCircleWithRadius(CGPointZero, radius: 0)
    var circleAlpha: Float    = 0
    var line1Alpha: Float     = 0

    switch style {
    default:
      line1Path  = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: CGFloat(M_PI), offset: CGPointZero)
      line1Alpha = 1
      line2Path  = ButtonPathHelper.createLineFromPoint(CGPointMake(0, size / 2), end: CGPointMake(size / 2 / 1.6, size / 2 + size / 2 / 1.6), offset: offset)
      line3Path   = ButtonPathHelper.createLineFromPoint(CGPointMake(0, size / 2), end: CGPointMake(size / 2 / 1.6, size / 2 - size / 2 / 1.6), offset: offset)
      return (line1Path, line2Path, line3Path, circlePath, circleAlpha, line1Alpha)
//    case .ArrowRight:
//      newLine1Path  = createCenteredLineWithRadius(intrinsicDimension / 2, angle: CGFloat(M_PI), offset: CGPointZero)
//      newLine1Alpha = 1
//      newLine2Path  = createLineFromPoint(CGPointMake(intrinsicDimension, intrinsicDimension / 2), toPoint: CGPointMake(intrinsicDimension - intrinsicDimension / 2 / 1.6, intrinsicDimension / 2 + intrinsicDimension / 2 / 1.6))
//      newLine3Path  = createLineFromPoint(CGPointMake(intrinsicDimension, intrinsicDimension / 2), toPoint: CGPointMake(intrinsicDimension - intrinsicDimension / 2 / 1.6, intrinsicDimension / 2 - intrinsicDimension / 2 / 1.6))
//    case .CaretDown:
//      newLine2Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(intrinsicDimension / 6, 0))
//      newLine3Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line3Layer.lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(-intrinsicDimension / 6, 0))
//    case .CaretLeft:
//      newLine2Path   = createCenteredLineWithRadius(intrinsicDimension / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(0, intrinsicDimension / 6))
//      newLine3Path   = createCenteredLineWithRadius(intrinsicDimension / 4 - line3Layer.lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(0, -intrinsicDimension / 6))
//    case .CaretRight:
//      newLine2Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(0, intrinsicDimension / 6))
//      newLine3Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line3Layer.lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(0, -intrinsicDimension / 6))
//    case .CaretUp:
//      newLine2Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line2Layer.lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(intrinsicDimension / 6, 0))
//      newLine3Path = createCenteredLineWithRadius(intrinsicDimension / 4 - line3Layer.lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(-intrinsicDimension / 6, 0))
//    case .CircleClose:
//      newCirclePath  = createCenteredCircleWithRadius(intrinsicDimension / 2)
//      newCircleAlpha = 1
//      newLine2Path   = createCenteredLineWithRadius(intrinsicDimension / 2 / 1.6, angle: CGFloat(M_PI_4), offset: CGPointZero)
//      newLine3Path   = createCenteredLineWithRadius(intrinsicDimension / 2 / 1.6, angle: CGFloat(-M_PI_4), offset: CGPointZero)
//    case .CirclePlus:
//      newCirclePath  = createCenteredCircleWithRadius(intrinsicDimension / 2)
//      newCircleAlpha = 1
//      newLine2Path   = createCenteredLineWithRadius(intrinsicDimension / 2 / 1.6, angle: CGFloat(M_PI_2), offset: CGPointZero)
//      newLine3Path   = createCenteredLineWithRadius(intrinsicDimension / 2 / 1.6, angle: 0, offset: CGPointZero)
//    case .Close:
//      newLine1Path = createCenteredLineWithRadius(intrinsicDimension / 2, angle: 0, offset: CGPointZero)
//      newLine2Path = createCenteredLineWithRadius(intrinsicDimension / 2, angle: CGFloat(M_PI_4), offset: CGPointZero)
//      newLine3Path = createCenteredLineWithRadius(intrinsicDimension / 2, angle: CGFloat(-M_PI_4), offset: CGPointZero)
//    case .Hamburger:
//      newLine1Path  = createCenteredLineWithRadius(intrinsicDimension / 2, angle: 0, offset: CGPointZero)
//      newLine1Alpha = 1
//      newLine2Path  = createCenteredLineWithRadius(intrinsicDimension / 2, angle: 0, offset: CGPointMake(0, intrinsicDimension / -2 / 1.6))
//      newLine3Path  = createCenteredLineWithRadius(intrinsicDimension / 2, angle: 0, offset: CGPointMake(0, intrinsicDimension / 2 / 1.6))
//    case .Plus:
//      newLine2Path = createCenteredLineWithRadius(intrinsicDimension / 2, angle: CGFloat(M_PI_2), offset: CGPointZero)
//      newLine3Path = createCenteredLineWithRadius(intrinsicDimension / 2, angle: 0, offset: CGPointZero)
    }
  }
}