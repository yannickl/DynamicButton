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

class DynamicButtonExampleTests: XCTestCase {
  func testDefaultStyle() {
    let dynamicButton = DynamicButton()

    XCTAssert(dynamicButton.style == .Hamburger)
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
}
