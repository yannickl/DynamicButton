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

import XCTest

class DynamicButtonExampleUITests: XCTestCase {
  override func setUp() {
    super.setUp()

    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    XCUIApplication().launch()

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    XCUIDevice.shared.orientation = .landscapeRight
  }

  func testStyleSelection() {
    let collectionViewsQuery = XCUIApplication().collectionViews

    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Arrow Down"]/*[[".cells.buttons[\"Arrow Down\"]",".buttons[\"Arrow Down\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Arrow Left"]/*[[".cells.buttons[\"Arrow Left\"]",".buttons[\"Arrow Left\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Arrow Right"]/*[[".cells.buttons[\"Arrow Right\"]",".buttons[\"Arrow Right\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Arrow Up"]/*[[".cells.buttons[\"Arrow Up\"]",".buttons[\"Arrow Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Caret Down"]/*[[".cells.buttons[\"Caret Down\"]",".buttons[\"Caret Down\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Caret Left"]/*[[".cells.buttons[\"Caret Left\"]",".buttons[\"Caret Left\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Caret Right"]/*[[".cells.buttons[\"Caret Right\"]",".buttons[\"Caret Right\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Caret Up"]/*[[".cells.buttons[\"Caret Up\"]",".buttons[\"Caret Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Check Mark"]/*[[".cells.buttons[\"Check Mark\"]",".buttons[\"Check Mark\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Circle Close"].press(forDuration: 0.7);/*[[".cells.buttons[\"Circle Close\"]",".tap()",".press(forDuration: 0.7);",".buttons[\"Circle Close\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Circle Plus"].press(forDuration: 1.0);/*[[".cells.buttons[\"Circle Plus\"]",".tap()",".press(forDuration: 1.0);",".buttons[\"Circle Plus\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Close"].press(forDuration: 0.8);/*[[".cells.buttons[\"Close\"]",".tap()",".press(forDuration: 0.8);",".buttons[\"Close\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Dot"]/*[[".cells.buttons[\"Dot\"]",".buttons[\"Dot\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Download"]/*[[".cells.buttons[\"Download\"]",".buttons[\"Download\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Hamburger"]/*[[".cells.buttons[\"Hamburger\"]",".buttons[\"Hamburger\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Line - Horizontal"]/*[[".cells.buttons[\"Line - Horizontal\"]",".buttons[\"Line - Horizontal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Line - Vertical"]/*[[".cells.buttons[\"Line - Vertical\"]",".buttons[\"Line - Vertical\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["More Options - Horizontal"]/*[[".cells.buttons[\"More Options - Horizontal\"]",".buttons[\"More Options - Horizontal\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["More Options - Vertical"]/*[[".cells.buttons[\"More Options - Vertical\"]",".buttons[\"More Options - Vertical\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.cells.buttons["Player - Fast Forward"]/*[[".cells.buttons[\"Player - Fast Forward\"]",".buttons[\"Player - Fast Forward\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Player - Pause"]/*[[".cells.buttons[\"Player - Pause\"]",".buttons[\"Player - Pause\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Player - Play"]/*[[".cells.buttons[\"Player - Play\"]",".buttons[\"Player - Play\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Player - Rewind"]/*[[".cells.buttons[\"Player - Rewind\"]",".buttons[\"Player - Rewind\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Player - Stop"]/*[[".cells.buttons[\"Player - Stop\"]",".buttons[\"Player - Stop\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Plus"]/*[[".cells.buttons[\"Plus\"]",".buttons[\"Plus\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Reload"]/*[[".cells.buttons[\"Reload\"]",".buttons[\"Reload\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.children(matching: .button).element.tap()
  }
}
