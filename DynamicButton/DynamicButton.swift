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
    case ArrowLeft   = "Arrow Left"
    case ArrowRight  = "Arrow Right"
    case CaretDown   = "Caret Down"
    case CaretLeft   = "Caret Left"
    case CaretRight  = "Caret Right"
    case CaretUp     = "Caret Up"
    case CircleClose = "Circle Close"
    case CirclePlus  = "Circle Plus"
    case Close       = "Close"
    case Hamburger   = "Hamburger"
    case Plus        = "Plus"

    static let allValues = [ArrowLeft, ArrowRight, CaretDown, CaretLeft, CaretRight, CaretUp, CircleClose, CirclePlus, Close, Hamburger, Plus]
  }

  private let line1Layer  = CAShapeLayer()
  private let line2Layer  = CAShapeLayer()
  private let line3Layer  = CAShapeLayer()
  private let circleLayer = CAShapeLayer()

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
      sublayer.fillColor     = UIColor.clearColor().CGColor
      sublayer.anchorPoint   = CGPointMake(0, 0)
      sublayer.lineJoin      = kCALineJoinRound
      sublayer.lineCap       = kCALineCapRound
      sublayer.contentsScale = layer.contentsScale
      sublayer.path          = UIBezierPath().CGPath
      sublayer.lineWidth     = 2
      sublayer.strokeColor   = UIColor.blackColor().CGColor

      layer.addSublayer(sublayer)
    }

    let width     = CGRectGetWidth(bounds) - contentEdgeInsets.left + contentEdgeInsets.right
    let height    = CGRectGetHeight(bounds) - contentEdgeInsets.top + contentEdgeInsets.bottom
    intrinsicSize = min(width, height)

    intrinsicOffset = CGPointMake((CGRectGetWidth(bounds) - intrinsicSize) / 2, (CGRectGetHeight(bounds) - intrinsicSize) / 2)
    buttonStyle     = .Hamburger
  }

  private var _style: Style = .Hamburger

  @IBInspectable var buttonStyle: Style {
    get {
      return _style
    }
    set (newValue) {
      setStyle(newValue, animated: false)
    }
  }

  public func setStyle(style: Style, animated: Bool) {
    _style = style

    let path = ButtonPathHelper.pathForButtonWithStyle(style, withSize: intrinsicSize, lineWidth: line1Layer.lineWidth, offset: intrinsicOffset)

    if animated {
      let configurations: [(keyPath: String, layer: CALayer, oldValue: AnyObject?, newValue: AnyObject?, key: String)] = [
        (keyPath: "path", layer: circleLayer, oldValue: circleLayer.path, newValue: path.circlePath, key: "animateCirclePath"),
        (keyPath: "opacity", layer: circleLayer, oldValue: circleLayer.opacity, newValue: path.circleAlpha, key: "animateCircleOpacityPath"),
        (keyPath: "path", layer: line1Layer, oldValue: line1Layer.path, newValue: path.line1, key: "animateLine1Path"),
        (keyPath: "opacity", layer: line1Layer, oldValue: line1Layer.opacity, newValue: path.line1Alpha, key: "animateLine1OpacityPath"),
        (keyPath: "path", layer: line2Layer, oldValue: line2Layer.path, newValue: path.line2, key: "animateLine2Path"),
        (keyPath: "path", layer: line3Layer, oldValue: line3Layer.path, newValue: path.line3, key: "animateLine3Path")
      ]

      for config in configurations {
        let anim       = springAnimationWithKeyPath(config.keyPath)
        anim.damping   = 10
        anim.fromValue = config.oldValue
        anim.toValue   = config.newValue

        config.layer.addAnimation(anim, forKey: config.key)
      }
    }

    circleLayer.path    = path.circlePath
    circleLayer.opacity = path.circleAlpha
    line1Layer.path     = path.line1
    line1Layer.opacity  = path.line1Alpha
    line2Layer.path     = path.line2
    line3Layer.path     = path.line3
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
      sublayer.strokeColor = UIColor.redColor().CGColor
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
      sublayer.strokeColor = UIColor.blackColor().CGColor
    }

    let anim                 = springAnimationWithKeyPath("transform.scale")
    anim.damping             = 100
    anim.initialVelocity     = 20
    anim.removedOnCompletion = false
    anim.toValue             = 1

    layer.addAnimation(anim, forKey: "scaledown")
  }
}