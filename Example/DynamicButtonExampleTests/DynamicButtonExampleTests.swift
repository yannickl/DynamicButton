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
import XCTest

class DynamicButtonExampleTests: XCTTestCaseTemplate {
  func testDefaultStyle() {
    let dynamicButton = DynamicButton()
    XCTAssert(dynamicButton.style == .Hamburger)
  }

  func testInitWithStyle() {
    let hamburger = DynamicButton(style: .Hamburger)
    XCTAssert(hamburger.style == .Hamburger)

    let arrowDown = DynamicButton(style: .ArrowDown)
    XCTAssert(arrowDown.style == .ArrowDown)

    let circlePlus = DynamicButton(style: .CirclePlus)
    XCTAssert(circlePlus.style == .CirclePlus)
  }

  func testSetStyle() {
    let dynamicButton = DynamicButton()

    dynamicButton.style = .Close
    XCTAssert(dynamicButton.style == .Close)

    dynamicButton.style = .Download
    XCTAssert(dynamicButton.style == .Download)

    dynamicButton.style = .FastForward
    XCTAssert(dynamicButton.style == .FastForward)
  }

  func testSetStyleAnimated() {
    let dynamicButton = DynamicButton()

    dynamicButton.setStyle(.Close, animated: true)
    XCTAssert(dynamicButton.style == .Close)

    dynamicButton.setStyle(.Download, animated: false)
    XCTAssert(dynamicButton.style == .Download)

    dynamicButton.setStyle(.FastForward, animated: true)
    XCTAssert(dynamicButton.style == .FastForward)
  }

  func testLineWidth() {
    let dynamicButton = DynamicButton()

    XCTAssert(dynamicButton.lineWidth == 2, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line1Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line2Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line3Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line4Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")

    dynamicButton.lineWidth = 6

    XCTAssert(dynamicButton.lineWidth == 6, "Line width should be equal to 6")
    XCTAssert(dynamicButton.line1Layer.lineWidth == dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssert(dynamicButton.line2Layer.lineWidth == dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssert(dynamicButton.line3Layer.lineWidth == dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssert(dynamicButton.line4Layer.lineWidth == dynamicButton.lineWidth, "Line width should be equal to 6")
  }

  func testStrokeColor() {
    let dynamicButton = DynamicButton()
    let blackColor    = UIColor.blackColor()

    XCTAssert(dynamicButton.strokeColor == blackColor, "Default color should be black")
    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, blackColor.CGColor), "Default color should be black")
    XCTAssert(CGColorEqualToColor(dynamicButton.line2Layer.strokeColor, blackColor.CGColor), "Default color should be black")
    XCTAssert(CGColorEqualToColor(dynamicButton.line3Layer.strokeColor, blackColor.CGColor), "Default color should be black")
    XCTAssert(CGColorEqualToColor(dynamicButton.line4Layer.strokeColor, blackColor.CGColor), "Default color should be black")

    let redColor              = UIColor.redColor()
    dynamicButton.strokeColor = redColor

    XCTAssert(dynamicButton.strokeColor == redColor, "Stroke color should be red")
    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, redColor.CGColor), "Stroke color should be red")
    XCTAssert(CGColorEqualToColor(dynamicButton.line2Layer.strokeColor, redColor.CGColor), "Stroke color should be red")
    XCTAssert(CGColorEqualToColor(dynamicButton.line3Layer.strokeColor, redColor.CGColor), "Stroke color should be red")
    XCTAssert(CGColorEqualToColor(dynamicButton.line4Layer.strokeColor, redColor.CGColor), "Stroke color should be red")
  }

  func testHighlightStokeColor() {
    let dynamicButton = DynamicButton()
    let blackColor    = UIColor.blackColor()

    dynamicButton.highlightAction()

    XCTAssert(dynamicButton.highlightStokeColor == nil, "Default highlight stroke color should be nil")
    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, blackColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line2Layer.strokeColor, blackColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line3Layer.strokeColor, blackColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line4Layer.strokeColor, blackColor.CGColor), "Highlight stroke color should be black like the stroke color")

    let redColor                      = UIColor.redColor()
    dynamicButton.highlightStokeColor = redColor
    dynamicButton.highlightAction()

    XCTAssert(dynamicButton.highlightStokeColor == redColor, "Default color should be red")
    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, redColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line2Layer.strokeColor, redColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line3Layer.strokeColor, redColor.CGColor), "Highlight stroke color should be black like the stroke color")
    XCTAssert(CGColorEqualToColor(dynamicButton.line4Layer.strokeColor, redColor.CGColor), "Highlight stroke color should be black like the stroke color")
  }

  func testHighlightAction() {
    let dynamicButton                 = DynamicButton()
    dynamicButton.highlightStokeColor = UIColor.greenColor()

    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.CGColor), "Stroke color should be green like the stroke color")

    dynamicButton.highlightAction()

    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, UIColor.greenColor().CGColor), "Stroke color should be green like the stroke color")
  }

  func testUnHighlightAction() {
    let dynamicButton                 = DynamicButton()
    dynamicButton.highlightStokeColor = UIColor.orangeColor()

    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.CGColor), "Stroke color should be green like the stroke color")

    dynamicButton.highlightAction()

    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, UIColor.orangeColor().CGColor), "Stroke color should be orange like the stroke color")

    dynamicButton.unhighlightAction()

    XCTAssert(CGColorEqualToColor(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.CGColor), "Stroke color should be green like the stroke color")
  }
}
