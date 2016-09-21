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
open class DynamicButtonStyle: CustomStringConvertible {
  /// Downwards arrow: ↓
  open static let arrowDown = DynamicButtonStyleArrowDown.self

  /// Leftwards arrow: ←
  open static let arrowLeft = DynamicButtonStyleArrowLeft.self

  /// Rightwards arrow: →
  open static let arrowRight = DynamicButtonStyleArrowRight.self

  /// Upwards arrow: ↑
  open static let arrowUp = DynamicButtonStyleArrowUp.self

  /// Down caret: ⌄
  open static let caretDown = DynamicButtonStyleCaretDown.self

  /// Left caret: ‹
  open static let caretLeft = DynamicButtonStyleCaretLeft.self

  /// Left caret: ›
  open static let caretRight = DynamicButtonStyleCaretRight.self

  /// Up caret: ⌃
  open static let caretUp = DynamicButtonStyleCaretUp.self

  /// Check mark: ✓
  open static let checkMark = DynamicButtonStyleCheckMark.self

  /// Close symbol surrounded by a circle
  open static let circleClose = DynamicButtonStyleCircleClose.self

  /// Plus symbol surrounded by a circle
  open static let circlePlus = DynamicButtonStyleCirclePlus.self

  /// Close symbol: X
  open static let close = DynamicButtonStyleClose.self

  /// Dot symbol: .
  open static let dot = DynamicButtonStyleDot.self

  /// Downwards triangle-headed arrow to bar: ⭳ \{U+2B73}
  open static let download = DynamicButtonStyleDownload.self

  /// Fast forward: ≫
  open static let fastForward = DynamicButtonStyleFastForward.self

  /// Hamburger button: ≡
  open static let hamburger = DynamicButtonStyleHamburger.self

  /// Horizontal line: ―
  open static let horizontalLine = DynamicButtonStyleHorizontalLine.self

  /// No style
  open static let none = DynamicButtonStyleNone.self

  /// Pause symbol: ‖
  open static let pause = DynamicButtonStylePause.self

  /// Play symbol: ► \{U+25B6}
  open static let play = DynamicButtonStylePlay.self

  /// Plus symbol: +
  open static let plus = DynamicButtonStylePlus.self

  /// Reload symbol: ↻
  open static let reload = DynamicButtonStyleReload.self

  /// Rewind symbol: ≪
  open static let rewind = DynamicButtonStyleRewind.self

  /// Stop symbol: ◼ \{U+2588}
  open static let stop = DynamicButtonStyleStop.self

  /// Vertical line: |
  open static let verticalLine = DynamicButtonStyleVerticalLine.self

  static let allStyles: [DynamicButtonStyle.Type] = [none, arrowDown, arrowLeft, arrowRight, arrowUp, caretDown, caretLeft, caretRight, caretUp, checkMark, circleClose, circlePlus, close, plus, dot, download, reload, rewind, fastForward, play, pause, stop, hamburger, horizontalLine, verticalLine]

  let path1: CGPath
  let path2: CGPath
  let path3: CGPath
  let path4: CGPath

  /**
   Initializes a dynamic button with 4 paths.

   - parameter path1: A path.
   - parameter path2: A path.
   - parameter path3: A path.
   - parameter path4: A path.
   */
  @available(*, deprecated: 10.0)
  public convenience init(path1: CGPath, path2: CGPath, path3: CGPath, path4: CGPath) {
    self.init(pathVector: (path1, path2, path3, path4))
  }

  /**
   Initializes a dynamic button with a vector of 4 paths.
   
   - parameter pathVector: A tuple of 4 paths.
   */
  public init(pathVector: (CGPath, CGPath, CGPath, CGPath)) {
    self.path1 = pathVector.0
    self.path2 = pathVector.1
    self.path3 = pathVector.2
    self.path4 = pathVector.3
  }

  /**
   Initializes a dynamic button style using a center point, the square area size, an offset point and the line width of the stroke.
   - parameter center: The center point of the area where path must be drawn.
   - parameter size: The size of the area. This is a float because the area is always a square.
   - parameter offset: The offset point of the button.
   - parameter lineWidth: The line width used to draw the stroke.
   */
  convenience required public init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let dummyPath = UIBezierPath().cgPath

    self.init(pathVector: (dummyPath, dummyPath, dummyPath, dummyPath))
  }

  // MARK: - Configuring Animation

  final func animationConfigurations(_ layer1: CAShapeLayer, layer2: CAShapeLayer, layer3: CAShapeLayer, layer4: CAShapeLayer) -> [(keyPath: String, layer: CAShapeLayer, newValue: CGPath?, key: String)] {
    return [
      (keyPath: "path", layer: layer4, newValue: path4, key: "animateLine4Path"),
      (keyPath: "path", layer: layer1, newValue: path1, key: "animateLine1Path"),
      (keyPath: "path", layer: layer2, newValue: path2, key: "animateLine2Path"),
      (keyPath: "path", layer: layer3, newValue: path3, key: "animateLine3Path")
    ]
  }

  // MARK: - Conforming the CustomStringConvertible Protocol

  /// A textual representation of `self`.
  open var description: String {
    return "No style"
  }
}
