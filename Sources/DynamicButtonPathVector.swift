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
 A path vector is a structure compound of 4 paths (p1, p2, p3, p4). It defines the geometric shape used to draw a `DynamicButton`.
 */
public struct DynamicButtonPathVector {
  /// The path p1.
  public let p1: CGPath

  /// The path p2.
  public let p2: CGPath

  /// The path p3.
  public let p3: CGPath

  /// The path p4.
  public let p4: CGPath

  /// The path vectore whose each path are equals to zero.
  public static let zero: DynamicButtonPathVector = DynamicButtonPathVector(p1: CGMutablePath(), p2: CGMutablePath(), p3: CGMutablePath(), p4: CGMutablePath())
}
