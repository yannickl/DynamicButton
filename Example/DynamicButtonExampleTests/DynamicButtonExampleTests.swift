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
    
    XCTAssert(dynamicButton.style == .hamburger)
  }

  func testInitWithStyle() {
    let hamburger = DynamicButton(style: .hamburger)
    XCTAssert(hamburger.style == .hamburger)

    let arrowDown = DynamicButton(style: .arrowDown)
    XCTAssert(arrowDown.style == .arrowDown)

    let circlePlus = DynamicButton(style: .circlePlus)
    XCTAssert(circlePlus.style == .circlePlus)
  }

  func testSetStyle() {
    let dynamicButton = DynamicButton()

    dynamicButton.style = .close
    XCTAssert(dynamicButton.style == .close)

    dynamicButton.style = .download
    XCTAssert(dynamicButton.style == .download)

    dynamicButton.style = .fastForward
    XCTAssert(dynamicButton.style == .fastForward)
  }

  func testSetStyleAnimated() {
    let dynamicButton = DynamicButton()

    dynamicButton.setStyle(.close, animated: true)
    XCTAssert(dynamicButton.style == .close)

    dynamicButton.setStyle(.download, animated: false)
    XCTAssert(dynamicButton.style == .download)

    dynamicButton.setStyle(.fastForward, animated: true)
    XCTAssert(dynamicButton.style == .fastForward)
  }

  func testLineWidth() {
    let dynamicButton = DynamicButton()

    XCTAssert(dynamicButton.lineWidth == 2, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line1Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line2Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line3Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")
    XCTAssert(dynamicButton.line4Layer.lineWidth == dynamicButton.lineWidth, "Default line width should be equal to 2")

    dynamicButton.lineWidth = 6

    XCTAssertEqual(dynamicButton.lineWidth, 6, "Line width should be equal to 6")
    XCTAssertEqual(dynamicButton.line1Layer.lineWidth, dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssertEqual(dynamicButton.line2Layer.lineWidth, dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssertEqual(dynamicButton.line3Layer.lineWidth, dynamicButton.lineWidth, "Line width should be equal to 6")
    XCTAssertEqual(dynamicButton.line4Layer.lineWidth, dynamicButton.lineWidth, "Line width should be equal to 6")
  }

  func testStrokeColor() {
    let dynamicButton = DynamicButton()
    let blackColor    = UIColor.black

    XCTAssertEqual(dynamicButton.strokeColor, blackColor, "Default color should be black")
    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, blackColor.cgColor, "Default color should be black")
    XCTAssertEqual(dynamicButton.line2Layer.strokeColor, blackColor.cgColor, "Default color should be black")
    XCTAssertEqual(dynamicButton.line3Layer.strokeColor, blackColor.cgColor, "Default color should be black")
    XCTAssertEqual(dynamicButton.line4Layer.strokeColor, blackColor.cgColor, "Default color should be black")

    let redColor              = UIColor.red
    dynamicButton.strokeColor = redColor

    XCTAssertEqual(dynamicButton.strokeColor, redColor, "Stroke color should be red")
    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, redColor.cgColor, "Stroke color should be red")
    XCTAssertEqual(dynamicButton.line2Layer.strokeColor, redColor.cgColor, "Stroke color should be red")
    XCTAssertEqual(dynamicButton.line3Layer.strokeColor, redColor.cgColor, "Stroke color should be red")
    XCTAssertEqual(dynamicButton.line4Layer.strokeColor, redColor.cgColor, "Stroke color should be red")
  }

  func testHighlightStokeColor() {
    let dynamicButton = DynamicButton()
    let blackColor    = UIColor.black

    dynamicButton.highlightAction()

    XCTAssertNil(dynamicButton.highlightStokeColor, "Default highlight stroke color should be nil")
    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, blackColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line2Layer.strokeColor, blackColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line3Layer.strokeColor, blackColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line4Layer.strokeColor, blackColor.cgColor, "Highlight stroke color should be black like the stroke color")

    let redColor                      = UIColor.red
    dynamicButton.highlightStokeColor = redColor
    dynamicButton.highlightAction()

    XCTAssertEqual(dynamicButton.highlightStokeColor, redColor, "Default color should be red")
    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, redColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line2Layer.strokeColor, redColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line3Layer.strokeColor, redColor.cgColor, "Highlight stroke color should be black like the stroke color")
    XCTAssertEqual(dynamicButton.line4Layer.strokeColor, redColor.cgColor, "Highlight stroke color should be black like the stroke color")
  }

  func testHighlightAction() {
    let dynamicButton                 = DynamicButton()
    dynamicButton.highlightStokeColor = UIColor.green

    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.cgColor, "Stroke color should be green like the stroke color")

    dynamicButton.highlightAction()

    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, UIColor.green.cgColor, "Stroke color should be green like the stroke color")
  }

  func testUnHighlightAction() {
    let dynamicButton                 = DynamicButton()
    dynamicButton.highlightStokeColor = UIColor.orange

    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.cgColor, "Stroke color should be green like the stroke color")

    dynamicButton.highlightAction()

    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, UIColor.orange.cgColor, "Stroke color should be orange like the stroke color")

    dynamicButton.unhighlightAction()

    XCTAssertEqual(dynamicButton.line1Layer.strokeColor, dynamicButton.strokeColor.cgColor, "Stroke color should be green like the stroke color")
  }

  func testBounceButtonOnTouchDefaultValue() {
    let dynamicButton = DynamicButton()

    XCTAssertTrue(dynamicButton.bounceButtonOnTouch)
  }
}
