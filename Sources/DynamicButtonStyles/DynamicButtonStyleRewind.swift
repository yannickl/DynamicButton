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

/// Rewind symbol style: ≪
struct DynamicButtonStyleRewind: DynamicButtonBuildableStyle {
  let pathVector: DynamicButtonPathVector

  init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let thirdSize = size / 3
    let sixthSize = size / 6
    
    let a = CGPoint(x: center.x - sixthSize, y: center.y)
    let b = CGPoint(x: center.x + sixthSize, y: center.y + thirdSize)
    let c = CGPoint(x: center.x + sixthSize, y: center.y - thirdSize)

    let ofc = PathHelper.gravityPointOffset(fromCenter: center, a: a, b: b, c: c)

    let p1 = PathHelper.line(from: a, to: b, offset: CGPoint(x: ofc.x - sixthSize, y: ofc.y))
    let p2 = PathHelper.line(from: a, to: b, offset: CGPoint(x: ofc.x + sixthSize, y: ofc.y))
    let p3 = PathHelper.line(from: a, to: c, offset: CGPoint(x: ofc.x - sixthSize, y: ofc.y))
    let p4 = PathHelper.line(from: a, to: c, offset: CGPoint(x: ofc.x + sixthSize, y: ofc.y))

    pathVector = DynamicButtonPathVector(p1: p1, p2: p2, p3: p3, p4: p4)
  }

  /// "Rewind" style.
  static var styleName: String {
    return "Player - Rewind"
  }
}
