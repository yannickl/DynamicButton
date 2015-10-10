//
//  DynamicButtonExampleUITests.swift
//  DynamicButtonExampleUITests
//
//  Created by Yannick LORIOT on 07/10/15.
//  Copyright © 2015 Yannick LORIOT. All rights reserved.
//

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
    XCUIDevice.sharedDevice().orientation = .LandscapeRight
  }

  override func tearDown() {
    super.tearDown()
  }

  func testStyleSelection() {
    let collectionViewsQuery = XCUIApplication().collectionViews

    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(0).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(1).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(2).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(3).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(4).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(5).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(6).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(7).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(8).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(9).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(10).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(11).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(12).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(13).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(14).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(15).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(16).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(17).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(18).childrenMatchingType(.Button).element.tap()
    collectionViewsQuery.childrenMatchingType(.Cell).elementBoundByIndex(19).childrenMatchingType(.Button).element.tap()
  }
}
