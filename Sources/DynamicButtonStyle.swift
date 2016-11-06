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
public enum DynamicButtonStyle {
  /// Downwards arrow: ↓
  case arrowDown
  /// Leftwards arrow: ←
  case arrowLeft
  /// Rightwards arrow: →
  case arrowRight
  /// Upwards arrow: ↑
  case arrowUp
  /// Down caret: ⌄
  case caretDown
  /// Left caret: ‹
  case caretLeft
  /// Left caret: ›
  case caretRight
  /// Up caret: ⌃
  case caretUp
  /// Check mark: ✓
  case checkMark
  /// Close symbol surrounded by a circle
  case circleClose
  /// Plus symbol surrounded by a circle
  case circlePlus
  /// Close symbol: X
  case close
  /// Dot symbol: .
  case dot
  /// Downwards triangle-headed arrow to bar: ⤓
  case download
  /// Fast forward: ≫
  case fastForward
  /// Hamburger button: ≡
  case hamburger
  /// Horizontal line: ―
  case horizontalLine
  /// Horizontal more options: …
  case horizontalMoreOptions
  /// No style
  case none
  /// Pause symbol: ‖
  case pause
  /// Play symbol: ► \{U+25B6}
  case play
  /// Plus symbol: +
  case plus
  /// Reload symbol: ↻
  case reload
  /// Rewind symbol: ≪
  case rewind
  /// Stop symbol: ◼ \{U+2588}
  case stop
  /// Vertical line: |
  case verticalLine
  /// Vertical more options: ⋮
  case verticalMoreOptions

  /// Returns all the available styles
  public static let all: [DynamicButtonStyle] = [none, arrowDown, arrowLeft, arrowRight, arrowUp, caretDown, caretLeft, caretRight, caretUp, checkMark, circleClose, circlePlus, close, plus, dot, download, reload, rewind, fastForward, play, pause, stop, hamburger, horizontalLine, verticalLine, horizontalMoreOptions, verticalMoreOptions]

  // MARK: - Building Button Styles

  func build(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> DynamicButtonBuildable {
    let buildable: DynamicButtonBuildable.Type

    switch self {
    case .arrowDown:
      buildable = DynamicButtonStyleArrowDown.self
    case .arrowLeft:
      buildable = DynamicButtonStyleArrowLeft.self
    case .arrowRight:
      buildable = DynamicButtonStyleArrowRight.self
    case .arrowUp:
      buildable = DynamicButtonStyleArrowUp.self
    case .caretDown:
      buildable = DynamicButtonStyleCaretDown.self
    case .caretLeft:
      buildable = DynamicButtonStyleCaretLeft.self
    case .caretRight:
      buildable = DynamicButtonStyleCaretRight.self
    case .caretUp:
      buildable = DynamicButtonStyleCaretUp.self
    case .checkMark:
      buildable = DynamicButtonStyleCheckMark.self
    case .circleClose:
      buildable = DynamicButtonStyleCircleClose.self
    case .circlePlus:
      buildable = DynamicButtonStyleCirclePlus.self
    case .close:
      buildable = DynamicButtonStyleClose.self
    case .dot:
      buildable = DynamicButtonStyleDot.self
    case .download:
      buildable = DynamicButtonStyleDownload.self
    case .fastForward:
      buildable = DynamicButtonStyleFastForward.self
    case .hamburger:
      buildable = DynamicButtonStyleHamburger.self
    case .horizontalLine:
      buildable = DynamicButtonStyleHorizontalLine.self
    case .horizontalMoreOptions:
      buildable = DynamicButtonStyleHorizontalMoreOptions.self
    case .none:
      buildable = DynamicButtonStyleNone.self
    case .pause:
      buildable = DynamicButtonStylePause.self
    case .play:
      buildable = DynamicButtonStylePlay.self
    case .plus:
      buildable = DynamicButtonStylePlus.self
    case .reload:
      buildable = DynamicButtonStyleReload.self
    case .rewind:
      buildable = DynamicButtonStyleRewind.self
    case .stop:
      buildable = DynamicButtonStyleStop.self
    case .verticalLine:
      buildable = DynamicButtonStyleVerticalLine.self
    default:
      buildable = DynamicButtonStyleVerticalMoreOptions.self
    }

    return buildable.init(center: center, size: size, offset: offset, lineWidth: lineWidth)
  }
}
