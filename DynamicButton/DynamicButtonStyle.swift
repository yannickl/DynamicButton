//
//  DynamicButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 16/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

extension DynamicButton.Style {
  func toto() {

  }
  
  // MARK: - Representing the Button as Drawing Lines

  private func createCircleWithRadius(center: CGPoint, radius: CGFloat) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, center.x + radius, center.y)
    CGPathAddArc(path, nil, center.x, center.y, radius, 0, 2 * CGFloat(M_PI), false)

    return path
  }

  private func createLineWithRadius(center: CGPoint, radius: CGFloat, angle: CGFloat, offset: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    let c = cos(angle)
    let s = sin(angle)

    CGPathMoveToPoint(path, nil, center.x + offset.x + radius * c, center.y + offset.y + radius * s)
    CGPathAddLineToPoint(path, nil, center.x + offset.x - radius * c, center.y + offset.y - radius * s)

    return path
  }

  /*private func createLineFromPoint(point: CGPoint, toPoint: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, offset.x + point.x, offset.y + point.y)
    CGPathAddLineToPoint(path, nil, offset.x + toPoint.x, offset.y + toPoint.y)
    
    return path
  }*/

  public func toLinePathsAtCenter(center: CGPoint, width: CGFloat) -> (line1: CGPathRef, line2: CGPathRef) {
    switch self {
    default:
      let line1  = createLineWithRadius(CGPointZero, radius: width, angle: CGFloat(M_PI), offset: CGPointZero)
      //newLine1Alpha = 1
      //let line2  = createLineFromPoint(CGPointMake(0, intrinsicDimension / 2), toPoint: CGPointMake(intrinsicDimension / 2 / 1.6, intrinsicDimension / 2 + intrinsicDimension / 2 / 1.6))
      //let line3   = createLineFromPoint(CGPointMake(0, intrinsicDimension / 2), toPoint: CGPointMake(intrinsicDimension / 2 / 1.6, intrinsicDimension / 2 - intrinsicDimension / 2 / 1.6))
      return (line1, line1)
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