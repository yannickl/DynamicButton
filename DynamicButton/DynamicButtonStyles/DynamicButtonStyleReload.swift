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

/// Reload symbol style: ↻
final public class DynamicButtonStyleReload: DynamicButtonStyle {
  convenience required public init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let curveBezierPath = UIBezierPath(arcCenter: center, radius: size / 2 - lineWidth, startAngle: 0, endAngle: CGFloat((3 * M_PI) / 2), clockwise: true)
    let path            = curveBezierPath.CGPath

    let thirdSize = size / 6
    let sixthSize = size / 12

    let path1 = CGPathCreateMutable()
    CGPathMoveToPoint(path1, nil, center.x, center.x - size / 2 + lineWidth)
    CGPathAddLineToPoint(path1, nil, center.x - sixthSize, center.x - size / 2 + lineWidth - thirdSize)

    let path2 = CGPathCreateMutable()
    CGPathMoveToPoint(path2, nil, center.x, center.x - size / 2 + lineWidth)
    CGPathAddLineToPoint(path2, nil, center.x - sixthSize, center.x - size / 2 + lineWidth + thirdSize)

    self.init(path1: path1, path2: path2, path3: path, path4: path)
  }

  // MARK: - Conforming the CustomStringConvertible Protocol

  /// A textual representation of "Reload" style.
  public override var description: String {
    return "Reload"
  }
}