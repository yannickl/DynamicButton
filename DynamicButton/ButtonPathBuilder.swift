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
  static func pathForButtonStyle(style: DynamicButton.Style) -> DynamicButtonPath.Type {
    switch style {
    case .ArrowDown:
      return ButtonArrowDownPath.self
    case .ArrowLeft:
      return ButtonArrowLeftPath.self
    case .ArrowRight:
      return ButtonArrowRightPath.self
    case .ArrowUp:
      return ButtonArrowUpPath.self
    case .CaretDown:
      return ButtonCaretDownPath.self
    case .CaretLeft:
      return ButtonCaretLeftPath.self
    case .CaretRight:
      return ButtonCaretRightPath.self
    case .CaretUp:
      return ButtonCaretUpPath.self
    case .CheckMark:
      return ButtonCheckMarkPath.self
    case .CircleClose:
      return ButtonCircleClosePath.self
    case .CirclePlus:
      return ButtonCirclePlusPath.self
    case .Close:
      return ButtonClosePath.self
    case .Dot:
      return ButtonDotPath.self
    case .Download:
      return ButtonDownloadPath.self
    case .FastForward:
      return ButtonFastForwardPath.self
    case .Hamburger:
      return ButtonHamburgerPath.self
    case .HorizontalLine:
      return ButtonHorizontalLinePath.self
    case .None:
      return ButtonNonePath.self
    case .Pause:
      return ButtonPausePath.self
    case .Play:
      return ButtonPlayPath.self
    case .Plus:
      return ButtonPlusPath.self
    case .Rewind:
      return ButtonRewindPath.self
    case .Stop:
      return ButtonStopPath.self
    case .VerticalLine:
      return ButtonVerticalLinePath.self
    }
  }
}