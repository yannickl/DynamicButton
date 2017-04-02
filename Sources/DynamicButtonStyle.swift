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

extension DynamicButton {
  /**
   A collection of predefined buton styles.
   */
  public enum Style {
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
    /// Custom style with its associate buildable style
    case custom(DynamicButtonBuildableStyle.Type)

    /// Returns all the available styles
    public static let all: [Style] = Style.buildableByStyle.map { $0 }.sorted { $0.0.value.styleName < $0.1.value.styleName }.map { $0.0 }

    // MARK: - Building Button Styles

    public func build(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> DynamicButtonBuildableStyle {
      switch self {
      case .custom(let buildable):
        return buildable.init(center: center, size: size, offset: offset, lineWidth: lineWidth)
      default:
        let buildable = Style.buildableByStyle[self]!

        return buildable.init(center: center, size: size, offset: offset, lineWidth: lineWidth)
      }
    }

    public var description: String {
      let buildable = Style.buildableByStyle[self]!

      return buildable.styleName
    }

    // MARK: - Convenient Style Description

    private static let buildableByStyle: [Style: DynamicButtonBuildableStyle.Type] = [
      none: DynamicButtonStyleNone.self,
      arrowDown: DynamicButtonStyleArrowDown.self,
      arrowLeft: DynamicButtonStyleArrowLeft.self,
      arrowRight: DynamicButtonStyleArrowRight.self,
      arrowUp: DynamicButtonStyleArrowUp.self,
      caretDown: DynamicButtonStyleCaretDown.self,
      caretLeft: DynamicButtonStyleCaretLeft.self,
      caretRight: DynamicButtonStyleCaretRight.self,
      caretUp: DynamicButtonStyleCaretUp.self,
      checkMark: DynamicButtonStyleCheckMark.self,
      circleClose: DynamicButtonStyleCircleClose.self,
      circlePlus: DynamicButtonStyleCirclePlus.self,
      close: DynamicButtonStyleClose.self,
      plus: DynamicButtonStylePlus.self,
      dot: DynamicButtonStyleDot.self,
      download: DynamicButtonStyleDownload.self,
      reload: DynamicButtonStyleReload.self,
      rewind: DynamicButtonStyleRewind.self,
      fastForward: DynamicButtonStyleFastForward.self,
      play: DynamicButtonStylePlay.self,
      pause: DynamicButtonStylePause.self,
      stop: DynamicButtonStyleStop.self,
      hamburger: DynamicButtonStyleHamburger.self,
      horizontalLine: DynamicButtonStyleHorizontalLine.self,
      verticalLine: DynamicButtonStyleVerticalLine.self,
      horizontalMoreOptions: DynamicButtonStyleHorizontalMoreOptions.self,
      verticalMoreOptions: DynamicButtonStyleVerticalMoreOptions.self
    ]

    /**
     Returns the style with the given style name.

     - parameter styleName: the style name defined by the `DynamicButtonBuildableStyle` protocol.
     */
    public static let styleByName: [String: Style] = Style.buildableByStyle.reduce([:]) { (acc, entry) in
      var acc = acc
      
      acc[entry.1.styleName] = entry.0
      
      return acc
    }
  }
}

extension DynamicButton.Style: Equatable {
  public static func ==(lhs: DynamicButton.Style, rhs: DynamicButton.Style) -> Bool {
    switch (lhs, rhs) {
    case (.none, .none), (.arrowDown, .arrowDown), (.arrowLeft, .arrowLeft), (.arrowRight, .arrowRight), (.arrowUp, .arrowUp), (.caretDown, .caretDown), (.caretLeft, .caretLeft), (.caretRight, .caretRight), (.caretUp, .caretUp), (.checkMark, .checkMark), (.circleClose, .circleClose), (.circlePlus, .circlePlus), (.close, .close), (.plus, .plus), (.dot, .dot), (.download, .download), (.reload, .reload), (.rewind, .rewind), (.fastForward, .fastForward), (.play, .play), (.pause, .pause), (.stop, .stop), (.hamburger, .hamburger), (.horizontalLine, .horizontalLine), (.verticalLine, .verticalLine), (.horizontalMoreOptions, .horizontalMoreOptions), (.verticalMoreOptions, .verticalMoreOptions):
      return true
    case (.custom(let b1), .custom(let b2)):
      return b1.styleName == b2.styleName
    default:
      return false
    }
  }
}

extension DynamicButton.Style: Hashable {
  public var hashValue: Int {
    switch self {
    case .none:
      return 0
    case .custom(let buildable):
      return buildable.styleName.hashValue
    default:
      return 1
    }
  }
}
