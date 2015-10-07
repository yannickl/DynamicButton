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

///
@IBDesignable final public class DynamicButton: UIButton {
  public enum Style: String {
    case ArrowLeft      = "Arrow Left"
    case ArrowRight     = "Arrow Right"
    case CaretDown      = "Caret Down"
    case CaretLeft      = "Caret Left"
    case CaretRight     = "Caret Right"
    case CaretUp        = "Caret Up"
    case CheckMark      = "Check Mark"
    case CircleClose    = "Circle Close"
    case CirclePlus     = "Circle Plus"
    case Close          = "Close"
    case FastForward    = "Fast Forward"
    case Hamburger      = "Hamburger"
    case HorizontalLine = "HorizontalLine"
    case Pause          = "Pause"
    case Plus           = "Plus"
    case VerticalLine   = "VerticalLine"

    static let allValues = [ArrowLeft, ArrowRight, CaretDown, CaretLeft, CaretRight, CaretUp, CheckMark, CircleClose, CirclePlus, Close, FastForward, Hamburger, HorizontalLine, Pause, Plus, VerticalLine]
  }

  private let line1Layer = CAShapeLayer()
  private let line2Layer = CAShapeLayer()
  private let line3Layer = CAShapeLayer()
  private let line4Layer = CAShapeLayer()

  private var buttonStyle: Style = .Hamburger

  private lazy var allLayers: [CAShapeLayer] = {
    return [self.line1Layer, self.line2Layer, self.line3Layer, self.line4Layer]
  }()

  override public init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setup()
  }

  public override func layoutSubviews() {
    super.layoutSubviews()

    let width  = CGRectGetWidth(bounds) - (contentEdgeInsets.left + contentEdgeInsets.right)
    let height = CGRectGetHeight(bounds) - (contentEdgeInsets.top + contentEdgeInsets.bottom)

    intrinsicSize   = min(width, height)
    intrinsicOffset = CGPointMake((CGRectGetWidth(bounds) - intrinsicSize) / 2, (CGRectGetHeight(bounds) - intrinsicSize) / 2)

    setStyle(buttonStyle, animated: false)
  }

  public override func setTitle(title: String?, forState state: UIControlState) {
    super.setTitle("", forState: state)
  }

  // MARK: - Managing the Button Setup

  /// Intrinsic square size
  private var intrinsicSize   = CGFloat(0)
  /// Intrinsic square offset
  private var intrinsicOffset = CGPointZero

  private func setup() {
    setTitle("", forState: .Normal)

    clipsToBounds = true
    
    addTarget(self, action: "highlightAction", forControlEvents: .TouchDown)
    addTarget(self, action: "highlightAction", forControlEvents: .TouchDragEnter)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchDragExit)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchUpInside)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchCancel)

    for sublayer in allLayers {
      layer.addSublayer(sublayer)
    }

    setupLayerPaths()
  }

  private func setupLayerPaths() {
    for sublayer in allLayers {
      sublayer.fillColor     = UIColor.clearColor().CGColor
      sublayer.anchorPoint   = CGPointMake(0, 0)
      sublayer.lineJoin      = kCALineJoinRound
      sublayer.lineCap       = kCALineCapRound
      sublayer.contentsScale = layer.contentsScale
      sublayer.path          = UIBezierPath().CGPath
      sublayer.lineWidth     = lineWidth
      sublayer.strokeColor   = strokeColor.CGColor
    }

    setStyle(buttonStyle, animated: false)
  }

  // MARK: - Configuring Buttons

  /// The button style. The setter is equivalent to the setStyle(, animated:) method with animated value to false. Defaults to Hamburger.
  @IBInspectable var style: Style {
    get {
      return buttonStyle
    }
    set (newValue) {
      setStyle(newValue, animated: false)
    }
  }

  /**
    Set the style of the button and animate the change if needed.
  
    - parameter style: The style of the button.
    - parameter animated: If true the transition between the old style and the new one is animated.
  */
  public func setStyle(style: Style, animated: Bool) {
    buttonStyle = style

    let paths = ButtonPathHelper.pathForButtonWithStyle(style, withSize: intrinsicSize, offset: intrinsicOffset, lineWidth: lineWidth)

    let configurations: [(keyPath: String, layer: CAShapeLayer, oldValue: CGPath?, newValue: CGPath?, key: String)] = [
      (keyPath: "path", layer: line4Layer, oldValue: line4Layer.path, newValue: paths.line4, key: "animateLine4Path"),
      (keyPath: "path", layer: line1Layer, oldValue: line1Layer.path, newValue: paths.line1, key: "animateLine1Path"),
      (keyPath: "path", layer: line2Layer, oldValue: line2Layer.path, newValue: paths.line2, key: "animateLine2Path"),
      (keyPath: "path", layer: line3Layer, oldValue: line3Layer.path, newValue: paths.line3, key: "animateLine3Path")
    ]

    if animated {
      for config in configurations {
        let anim       = springAnimationWithKeyPath(config.keyPath)
        anim.damping   = 10
        anim.fromValue = config.oldValue
        anim.toValue   = config.newValue

        config.layer.addAnimation(anim, forKey: config.key)
      }
    }

    for config in configurations {
      config.layer.path = config.newValue
    }
  }

  /// Specifies the line width used when stroking the button paths. Defaults to two.
  @IBInspectable public var lineWidth: CGFloat = 2 {
    didSet {
      setupLayerPaths()
    }
  }

  /// Specifies the color to fill the path's stroked outlines, or nil for no stroking. Defaults to black.
  @IBInspectable public var strokeColor: UIColor = UIColor.blackColor() {
    didSet {
      setupLayerPaths()
    }
  }

  /// Specifies the color to fill the path's stroked outlines when the button is highlighted, or nil to use the strokeColor. Defaults to nil.
  @IBInspectable public var highlightStokeColor: UIColor? = nil

  // MARK: - Animating Buttons

  private func springAnimationWithKeyPath(keyPath: String) -> CASpringAnimation {
    let anim                 = CASpringAnimation(keyPath: keyPath)
    anim.duration            = anim.settlingDuration
    anim.fillMode            = kCAFillModeForwards
    anim.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

    return anim
  }

  // MARK: - Action Methods

  func highlightAction() {
    for sublayer in allLayers {
      sublayer.strokeColor = (highlightStokeColor ?? strokeColor).CGColor
    }

    let anim                 = springAnimationWithKeyPath("transform.scale")
    anim.damping             = 20
    anim.stiffness           = 1000
    anim.removedOnCompletion = false
    anim.toValue             = 1.2

    layer.addAnimation(anim, forKey: "scaleup")
  }

  func unhighlightAction() {
    for sublayer in allLayers {
      sublayer.strokeColor = strokeColor.CGColor
    }

    let anim                 = springAnimationWithKeyPath("transform.scale")
    anim.damping             = 100
    anim.initialVelocity     = 20
    anim.removedOnCompletion = false
    anim.toValue             = 1

    layer.addAnimation(anim, forKey: "scaledown")
  }
}