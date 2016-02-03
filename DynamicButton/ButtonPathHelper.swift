/*
 * DynamicButton
 *
 * Copyright 2015-present Yannick Loriot.
 * http://yannickloriot.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit

/// Manage the line paths for each button styles.
internal class ButtonPathHelper {
  private static let F_PI_2 = CGFloat(M_PI_2)
  private static let F_PI_4 = CGFloat(M_PI_4)

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

  /**
  Creates and returns the paths corresponding to the given style with its space constraints.
  
  - parameter style: The style to draw.
  - parameter size: The size in which the path have to be drawn.
  - parameter offset: The offset (x, y) where the drawing whould start.
  - parameter lineWidth: The stroke's line width.
  - returns The path for each available line layer.
  */
  class func pathForButtonWithStyle(style: DynamicButton.Style, withSize size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> (line1: CGPathRef, line2: CGPathRef, line3: CGPathRef, line4: CGPathRef) {
    let center = CGPoint(x: offset.x + size / 2, y: offset.y + size / 2)

    let line1Path: CGPathRef
    let line2Path: CGPathRef
    let line3Path: CGPathRef
    let line4Path: CGPathRef

    switch style {
    case .ArrowDown:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y), end: CGPointMake(center.x, offset.y + size - lineWidth))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + size - lineWidth), end: CGPoint(x: center.x - size / 3.2, y: offset.y + size - size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + size - lineWidth), end: CGPoint(x: center.x + size / 3.2, y: offset.y + size - size / 3.2))
      line4Path = line1Path
    case .ArrowLeft:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x + lineWidth, center.y), end: CGPointMake(offset.x + size, center.y))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x + lineWidth, center.y), end: CGPoint(x: offset.x + size / 3.2, y: center.y + size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x + lineWidth, center.y), end: CGPoint(x: offset.x + size / 3.2, y: center.y - size / 3.2))
      line4Path = line1Path
    case .ArrowRight:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x, center.y), end: CGPointMake(offset.x + size - lineWidth, center.y))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x + size - lineWidth, center.y), end: CGPoint(x: offset.x + size - size / 3.2, y: center.y + size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(offset.x + size - lineWidth, center.y), end: CGPoint(x: offset.x + size - size / 3.2, y: center.y - size / 3.2))
      line4Path = line1Path
    case .ArrowUp:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + lineWidth), end: CGPointMake(center.x, offset.y + size))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + lineWidth), end: CGPoint(x: center.x - size / 3.2, y: offset.y + size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + lineWidth), end: CGPoint(x: center.x + size / 3.2, y: offset.y + size / 3.2))
      line4Path = line1Path
    case .CaretDown:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y - size / 3), offset: CGPointMake(0, size / 6))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y - size / 3), offset: CGPointMake(0, size / 6))
      line4Path = line3Path
    case .CaretLeft:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y - size / 3), offset: CGPointMake(-size / 6, 0))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y + size / 3), offset: CGPointMake(-size / 6, 0))
      line4Path = line3Path
    case .CaretRight:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y - size / 3), offset: CGPointMake(size / 6, 0))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y + size / 3), offset: CGPointMake(size / 6, 0))
      line4Path = line3Path
    case .CaretUp:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y + size / 3), offset: CGPointMake(0, -size / 6))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y + size / 3), offset: CGPointMake(0, -size / 6))
      line4Path = line3Path
    case .CheckMark:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: offset.x + size / 4, y: offset.y + size / 4), end: CGPoint(x: center.x, y: center.y), offset: CGPointMake(-size / 8, size / 4))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: offset.x + size, y: offset.y), offset: CGPointMake(-size / 8, size / 4))
      line4Path = line3Path
    case .CircleClose:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: F_PI_4)
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: -F_PI_4)
      line4Path = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2 - lineWidth)
    case .CirclePlus:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: F_PI_2)
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 3.2, angle: 0)
      line4Path = ButtonPathHelper.createCircleWithRadius(center, radius: size / 2 - lineWidth)
    case .Close:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: F_PI_4)
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: -F_PI_4)
      line4Path = line3Path
    case .Dot:
      line1Path = ButtonPathHelper.createLineFromPoint(center, end: center)
      line2Path = line1Path
      line3Path = line1Path
      line4Path = line1Path
    case .Download:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y), end: CGPointMake(center.x, offset.y + size - lineWidth))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + size - lineWidth), end: CGPoint(x: center.x - size / 3.2, y: offset.y + size - size / 3.2))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x, offset.y + size - lineWidth), end: CGPoint(x: center.x + size / 3.2, y: offset.y + size - size / 3.2))
      line4Path = ButtonPathHelper.createLineFromPoint(CGPointMake(center.x - size / 3.2, offset.y + size - lineWidth), end: CGPoint(x: center.x + size / 3.2, y: offset.y + size - lineWidth))
    case .FastForward:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y - size / 3), offset: CGPointMake(size / 6 + size / 6, 0))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y - size / 3), offset: CGPointMake(size / 6 - size / 6, 0))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y + size / 3), offset: CGPointMake(size / 6 + size / 6, 0))
      line4Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x - size / 3, y: center.y + size / 3), offset: CGPointMake(size / 6 - size / 6, 0))
    case .Hamburger:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line2Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / -3.2))
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0, offset: CGPointMake(0, size / 3.2))
      line4Path = line1Path
    case .HorizontalLine:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line2Path = line1Path
      line3Path = line1Path
      line4Path = line1Path
    case .Pause:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: F_PI_2, offset: CGPoint(x: size / -4, y: 0))
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: F_PI_2, offset: CGPoint(x: size / 4, y: 0))
      line4Path = line3Path
    case .Plus:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: F_PI_2)
      line2Path = line1Path
      line3Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: 0)
      line4Path = line3Path
    case .Rewind:
      line1Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y - size / 3), offset: CGPointMake(-size / 6 - size / 6, 0))
      line2Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y - size / 3), offset: CGPointMake(-size / 6 + size / 6, 0))
      line3Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y + size / 3), offset: CGPointMake(-size / 6 - size / 6, 0))
      line4Path = ButtonPathHelper.createLineFromPoint(CGPoint(x: center.x, y: center.y), end: CGPoint(x: center.x + size / 3, y: center.y + size / 3), offset: CGPointMake(-size / 6 + size / 6, 0))
    case .VerticalLine:
      line1Path = ButtonPathHelper.createLineWithRadius(center, radius: size / 2, angle: F_PI_2)
      line2Path = line1Path
      line3Path = line1Path
      line4Path = line1Path
    }

    return (line1Path, line2Path, line3Path, line4Path)
  }
}