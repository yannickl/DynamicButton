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
 A button path is a container with the necessary paths to build the button.
 */
class ButtonPath {
  let path1: CGPathRef
  let path2: CGPathRef
  let path3: CGPathRef
  let path4: CGPathRef

  required init(path1: CGPathRef, path2: CGPathRef, path3: CGPathRef, path4: CGPathRef) {
    self.path1 = path1
    self.path2 = path2
    self.path3 = path3
    self.path4 = path4
  }

  convenience required init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let dummyPath = UIBezierPath().CGPath

    self.init(path1: dummyPath, path2: dummyPath, path3: dummyPath, path4: dummyPath)
  }

  // MARK: - Building Configuration

  func animationConfigurations(layer1: CAShapeLayer, layer2: CAShapeLayer, layer3: CAShapeLayer, layer4: CAShapeLayer) -> [(keyPath: String, layer: CAShapeLayer, oldValue: CGPath?, newValue: CGPath?, key: String)] {
    return [
      (keyPath: "path", layer: layer4, oldValue: layer4.path, newValue: path4, key: "animateLine4Path"),
      (keyPath: "path", layer: layer1, oldValue: layer1.path, newValue: path1, key: "animateLine1Path"),
      (keyPath: "path", layer: layer2, oldValue: layer2.path, newValue: path2, key: "animateLine2Path"),
      (keyPath: "path", layer: layer3, oldValue: layer4.path, newValue: path3, key: "animateLine3Path")
    ]
  }
}
