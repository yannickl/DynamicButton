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
  static func pathForButtonStyle(style: DynamicButton.Style, withSize size: CGFloat, offset: CGPoint, lineWidth: CGFloat) -> ButtonPath {
    let center = CGPoint(x: offset.x + size / 2, y: offset.y + size / 2)

    let buttonPathType: ButtonPath.Type

    switch style {
    case .ArrowDown:
      buttonPathType = ButtonArrowDownPath.self
    case .ArrowLeft:
      buttonPathType = ButtonArrowLeftPath.self
    case .ArrowRight:
      buttonPathType = ButtonArrowRightPath.self
    case .ArrowUp:
      buttonPathType = ButtonArrowUpPath.self
    case .CaretDown:
      buttonPathType = ButtonCaretDownPath.self
    case .CaretLeft:
      buttonPathType = ButtonCaretLeftPath.self
    case .CaretRight:
      buttonPathType = ButtonCaretRightPath.self
    case .CaretUp:
      buttonPathType = ButtonCaretUpPath.self
    case .CheckMark:
      buttonPathType = ButtonCheckMarkPath.self
    case .CircleClose:
      buttonPathType = ButtonCircleClosePath.self
    case .CirclePlus:
      buttonPathType = ButtonCirclePlusPath.self
    case .Close:
      buttonPathType = ButtonClosePath.self
    case .Dot:
      buttonPathType = ButtonDotPath.self
    case .Download:
      buttonPathType = ButtonDownloadPath.self
    case .FastForward:
      buttonPathType = ButtonFastForwardPath.self
    case .Hamburger:
      buttonPathType = ButtonHamburgerPath.self
    case .HorizontalLine:
      buttonPathType = ButtonHorizontalLinePath.self
    case .None:
      buttonPathType = ButtonNonePath.self
    case .Pause:
      buttonPathType = ButtonPausePath.self
    case .Play:
      buttonPathType = ButtonPlayPath.self
    case .Plus:
      buttonPathType = ButtonPlusPath.self
    case .Rewind:
      buttonPathType = ButtonRewindPath.self
    case .Stop:
      buttonPathType = ButtonStopPath.self
    case .VerticalLine:
      buttonPathType = ButtonVerticalLinePath.self
    }

    return buttonPathType.init(center: center, size: size, offset: offset, lineWidth: lineWidth)
  }
}