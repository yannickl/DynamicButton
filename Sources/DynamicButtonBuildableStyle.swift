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

/**
 A dynamic button style must adopt the buildable protocol. It allows the `DynamicButton` to know how build and display the style's shape.
 
 A `DynamicButtonBuildableStyle` provides a `pathVector` vector property and an `init` method to build it.
 */
public protocol DynamicButtonBuildableStyle: CustomStringConvertible {
  /// The path vector used by the `DynamicButton` to display the shape.
  var pathVector: DynamicButtonPathVector { get }

  /**
   The init provides some informations in order to build the `pathVector`.
   
   - parameter center: The center point of the area where path must be drawn.
   - parameter size: The size of the area. This is a float because the area is always a square.
   - parameter offset: The offset point of the button.
   - parameter lineWidth: The line width used to draw the stroke.
   */
  init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat)

  /// The style name as a string.
  static var styleName: String { get }
}

extension DynamicButtonBuildableStyle {
  internal func animationConfigurations(_ layer1: CAShapeLayer, layer2: CAShapeLayer, layer3: CAShapeLayer, layer4: CAShapeLayer) -> [(keyPath: String, layer: CAShapeLayer, newValue: CGPath?, key: String)] {
    return [(keyPath: "path", layer: layer4, newValue: pathVector.p4, key: "animateLine4Path"),
            (keyPath: "path", layer: layer1, newValue: pathVector.p1, key: "animateLine1Path"),
            (keyPath: "path", layer: layer2, newValue: pathVector.p2, key: "animateLine2Path"),
            (keyPath: "path", layer: layer3, newValue: pathVector.p3, key: "animateLine3Path")]
  }

  public var description: String {
    return Self.styleName
  }
}
