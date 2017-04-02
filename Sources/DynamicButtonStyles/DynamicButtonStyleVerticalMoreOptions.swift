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

/// Vertical more options style: ⋮
struct DynamicButtonStyleVerticalMoreOptions: DynamicButtonBuildableStyle {
  let pathVector: DynamicButtonPathVector

  init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let y       = center.y - lineWidth / 2
    let midSize = size / 2

    let p1 = UIBezierPath(roundedRect: CGRect(x: center.x - lineWidth / 2, y: y - midSize + lineWidth, width: lineWidth, height: lineWidth), cornerRadius: lineWidth / 2).cgPath
    let p2 = UIBezierPath(roundedRect: CGRect(x: center.x - lineWidth / 2, y: y, width: lineWidth, height: lineWidth), cornerRadius: lineWidth / 2).cgPath
    let p3 = UIBezierPath(roundedRect: CGRect(x: center.x - lineWidth / 2, y: y + midSize - lineWidth, width: lineWidth, height: lineWidth), cornerRadius: lineWidth / 2).cgPath

    pathVector = DynamicButtonPathVector(p1: p1, p2: p2, p3: p3, p4: p2)
  }

  /// "Vertical More Options" style.
  static var styleName: String {
    return "More Options - Vertical"
  }
}
