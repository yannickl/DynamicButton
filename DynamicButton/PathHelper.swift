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

/// Helper methods to manipulate paths.
internal class PathHelper {
  static let F_PI_2 = CGFloat(M_PI_2)
  static let F_PI_4 = CGFloat(M_PI_4)

  // MARK: - Representing the Button as Drawing Lines

  /// Creates a circle from a given center point and a radius.
  class func circleAtCenter(center: CGPoint, radius: CGFloat) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, center.x + radius, center.y)
    CGPathAddArc(path, nil, center.x, center.y, radius, 0, 2 * CGFloat(M_PI), false)

    return path
  }

  /// Creates an oblique line using a center point, a radius and an angle.
  class func lineAtCenter(center: CGPoint, radius: CGFloat, angle: CGFloat, offset: CGPoint = CGPointZero) -> CGPathRef {
    let path = CGPathCreateMutable()

    let c = cos(angle)
    let s = sin(angle)

    CGPathMoveToPoint(path, nil, center.x + offset.x + radius * c, center.y + offset.y + radius * s)
    CGPathAddLineToPoint(path, nil, center.x + offset.x - radius * c, center.y + offset.y - radius * s)

    return path
  }

  /// Creates a line between two point.
  class func lineFrom(startPoint: CGPoint, to endPoint: CGPoint, offset: CGPoint = CGPointZero) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, offset.x + startPoint.x, offset.y + startPoint.y)
    CGPathAddLineToPoint(path, nil, offset.x + endPoint.x, offset.y + endPoint.y)

    return path
  }

  // MARK: - Trigonometry Methods

  /// Compute the gravity center from 3 points.
  class func gravityPointOffsetFromCenter(center: CGPoint, a: CGPoint, b: CGPoint, c: CGPoint) -> CGPoint {
    let gravityCenter = CGPoint(x: (a.x + b.x + c.x) / 3, y: (a.y + b.y + c.y) / 3)

    return CGPoint(x: center.x - gravityCenter.x, y: center.y - gravityCenter.y)
  }

  // Compute the destination point from a center, an angle and a radius
  class func pointFromCenter(center: CGPoint, radius: CGFloat, angle: CGFloat) -> CGPoint {
    return CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
  }
}