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

/// Create the line paths for each button styles.
internal class ButtonPathBuilder {
  /**
   Creates and returns the button paths corresponding to the given style with its space constraints.

   - parameter style: The style to draw.
   - parameter size: The size in which the path have to be drawn.
   - parameter offset: The offset (x, y) where the drawing whould start.
   - parameter lineWidth: The stroke's line width.
   - returns The button path for the given style.
   */
  static func pathForButtonStyle(style: DynamicButton.Style) -> DynamicButtonStyle.Type {
    switch style {
    case .ArrowDown:
      return DynamicButtonStyleArrowDown.self
    case .ArrowLeft:
      return DynamicButtonStyleArrowLeft.self
    case .ArrowRight:
      return DynamicButtonStyleArrowRight.self
    case .ArrowUp:
      return DynamicButtonStyleArrowUp.self
    case .CaretDown:
      return DynamicButtonStyleCaretDown.self
    case .CaretLeft:
      return DynamicButtonStyleCaretLeft.self
    case .CaretRight:
      return DynamicButtonStyleCaretRight.self
    case .CaretUp:
      return DynamicButtonStyleCaretUp.self
    case .CheckMark:
      return DynamicButtonStyleCheckMark.self
    case .CircleClose:
      return DynamicButtonStyleCircleClose.self
    case .CirclePlus:
      return DynamicButtonStyleCirclePlus.self
    case .Close:
      return DynamicButtonStyleClose.self
    case .Dot:
      return DynamicButtonStyleDot.self
    case .Download:
      return DynamicButtonStyleDownload.self
    case .FastForward:
      return DynamicButtonStyleFastForward.self
    case .Hamburger:
      return DynamicButtonStyleHamburger.self
    case .HorizontalLine:
      return DynamicButtonStyleHorizontalLine.self
    case .None:
      return DynamicButtonStyleNone.self
    case .Pause:
      return DynamicButtonStylePause.self
    case .Play:
      return DynamicButtonStylePlay.self
    case .Plus:
      return DynamicButtonStylePlus.self
    case .Rewind:
      return DynamicButtonStyleRewind.self
    case .Stop:
      return DynamicButtonStyleStop.self
    case .VerticalLine:
      return DynamicButtonStyleVerticalLine.self
    }
  }
}