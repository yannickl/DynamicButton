//
//  DynamicButton.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 29/08/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

@IBDesignable final public class DynamicButton: UIButton {
  public enum Style: String {
    case ArrowLeft      = "Arrow Left"
    case ArrowRight     = "Arrow Right"
    case CaretDown      = "Caret Down"
    case CaretLeft      = "Caret Left"
    case CaretRight     = "Caret Right"
    case CaretUp        = "Caret Up"
    case CircleClose    = "Circle Close"
    case CirclePlus     = "Circle Plus"
    case Close          = "Close"
    case Hamburger      = "Hamburger"
    case HorizontalLine = "HorizontalLine"
    case Pause          = "Pause"
    case Plus           = "Plus"
    case VerticalLine   = "VerticalLine"

    static let allValues = [ArrowLeft, ArrowRight, CaretDown, CaretLeft, CaretRight, CaretUp, CircleClose, CirclePlus, Close, Hamburger, HorizontalLine, Pause, Plus, VerticalLine]
  }

  private let line1Layer  = CAShapeLayer()
  private let line2Layer  = CAShapeLayer()
  private let line3Layer  = CAShapeLayer()
  private let circleLayer = CAShapeLayer()

  private var buttonStyle: Style = .Hamburger

  private lazy var allLayers: [CAShapeLayer] = {
    return [self.line1Layer, self.line2Layer, self.line3Layer, self.circleLayer]
  }()

  override public init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setup()
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

    addTarget(self, action: "highlightAction", forControlEvents: .TouchDown)
    addTarget(self, action: "highlightAction", forControlEvents: .TouchDragEnter)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchDragExit)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchUpInside)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchCancel)

    for sublayer in allLayers {
      layer.addSublayer(sublayer)
    }

    layoutLayerPaths()

    let width  = CGRectGetWidth(bounds) - contentEdgeInsets.left + contentEdgeInsets.right
    let height = CGRectGetHeight(bounds) - contentEdgeInsets.top + contentEdgeInsets.bottom

    intrinsicSize   = min(width, height)
    intrinsicOffset = CGPointMake((CGRectGetWidth(bounds) - intrinsicSize) / 2, (CGRectGetHeight(bounds) - intrinsicSize) / 2)
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

    let paths = ButtonPathHelper.pathForButtonWithStyle(style, withSize: intrinsicSize, lineWidth: lineWidth, offset: intrinsicOffset)

    if animated {
      let configurations: [(keyPath: String, layer: CALayer, oldValue: AnyObject?, newValue: AnyObject?, key: String)] = [
        (keyPath: "path", layer: circleLayer, oldValue: circleLayer.path, newValue: paths.circlePath, key: "animateCirclePath"),
        (keyPath: "opacity", layer: circleLayer, oldValue: circleLayer.opacity, newValue: paths.circleAlpha, key: "animateCircleOpacityPath"),
        (keyPath: "path", layer: line1Layer, oldValue: line1Layer.path, newValue: paths.line1, key: "animateLine1Path"),
        (keyPath: "path", layer: line2Layer, oldValue: line2Layer.path, newValue: paths.line2, key: "animateLine2Path"),
        (keyPath: "path", layer: line3Layer, oldValue: line3Layer.path, newValue: paths.line3, key: "animateLine3Path")
      ]

      for config in configurations {
        let anim       = springAnimationWithKeyPath(config.keyPath)
        anim.damping   = 10
        anim.fromValue = config.oldValue
        anim.toValue   = config.newValue

        config.layer.addAnimation(anim, forKey: config.key)
      }
    }

    circleLayer.path    = paths.circlePath
    circleLayer.opacity = paths.circleAlpha
    line1Layer.path     = paths.line1
    line2Layer.path     = paths.line2
    line3Layer.path     = paths.line3
  }

  /// Specifies the line width used when stroking the button paths. Defaults to two.
  public var lineWidth: CGFloat = 2 {
    didSet {
      layoutLayerPaths()
    }
  }

  /// Specifies the color to fill the path's stroked outlines, or nil for no stroking. Defaults to black.
  public var strokeColor: UIColor = UIColor.blackColor() {
    didSet {
      layoutLayerPaths()
    }
  }

  /// Specifies the color to fill the path's stroked outlines when the button is highlighted, or nil to use the strokeColor. Defaults to nil.
  public var highlightStokeColor: UIColor? = nil

  private func layoutLayerPaths() {
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

  // MARK: - Animating Buttons

  private func springAnimationWithKeyPath(keyPath: String) -> CASpringAnimation {
    let anim                 = CASpringAnimation(keyPath: keyPath)
    anim.duration            = anim.settlingDuration
    anim.fillMode            = kCAFillModeForwards
    anim.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

    return anim
  }

  // MARK: - Action Methods

  internal func highlightAction() {
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

  internal func unhighlightAction() {
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