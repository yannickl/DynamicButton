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

  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setup()
  }

  public override func setTitle(title: String?, forState state: UIControlState) {
    super.setTitle("", forState: state)
  }

  // MARK: - Managing the Button Setup

  private var intrinsicSquareSize: CGFloat = 0
  private var offset      = CGPointZero
  private var centerPoint = CGPointZero

  private func setup() {
    setTitle("", forState: .Normal)
    
    addTarget(self, action: "highlightAction", forControlEvents: .TouchDown)
    addTarget(self, action: "highlightAction", forControlEvents: .TouchDragEnter)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchDragExit)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchUpInside)
    addTarget(self, action: "unhighlightAction", forControlEvents: .TouchUpOutside)
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

    // in case the button is not square, the offset will be use to keep our CGPath's centered in it.
    let width           = CGRectGetWidth(bounds) - contentEdgeInsets.left + contentEdgeInsets.right
    let height          = CGRectGetHeight(bounds) - contentEdgeInsets.top + contentEdgeInsets.bottom
    intrinsicSquareSize = min(width, height)

    offset = CGPointMake((CGRectGetWidth(bounds) - intrinsicSquareSize) / 2, (CGRectGetHeight(bounds) - intrinsicSquareSize) / 2)

    centerPoint = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
    buttonStyle = .Hamburger
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

    let newCirclePath: CGPathRef
    let newLine1Path: CGPathRef
    let newLine2Path: CGPathRef
    let newLine3Path: CGPathRef
    let newCircleAlpha: Float
    let newLine1Alpha: Float

    switch style {
    case .ArrowLeft:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: CGFloat(M_PI), offset: CGPointZero)
      newLine1Alpha  = 1
      newLine2Path   = createLineFromPoint(CGPointMake(0, intrinsicSquareSize / 2), toPoint: CGPointMake(intrinsicSquareSize / 2 / 1.6, intrinsicSquareSize / 2 + intrinsicSquareSize / 2 / 1.6))
      newLine3Path   = createLineFromPoint(CGPointMake(0, intrinsicSquareSize / 2), toPoint: CGPointMake(intrinsicSquareSize / 2 / 1.6, intrinsicSquareSize / 2 - intrinsicSquareSize / 2 / 1.6))
    case .ArrowRight:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: CGFloat(M_PI), offset: CGPointZero)
      newLine1Alpha  = 1
      newLine2Path   = createLineFromPoint(CGPointMake(intrinsicSquareSize, intrinsicSquareSize / 2), toPoint: CGPointMake(intrinsicSquareSize - intrinsicSquareSize / 2 / 1.6, intrinsicSquareSize / 2 + intrinsicSquareSize / 2 / 1.6))
      newLine3Path   = createLineFromPoint(CGPointMake(intrinsicSquareSize, intrinsicSquareSize / 2), toPoint: CGPointMake(intrinsicSquareSize - intrinsicSquareSize / 2 / 1.6, intrinsicSquareSize / 2 - intrinsicSquareSize / 2 / 1.6))
    case .CaretDown:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(intrinsicSquareSize / 6, 0))
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line3Layer.lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(-intrinsicSquareSize / 6, 0))
    case .CaretLeft:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-M_PI_4), offset: CGPointMake(intrinsicSquareSize / 6, 0))
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line3Layer.lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(0, -intrinsicSquareSize / 6))
    case .CaretRight:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line2Layer.lineWidth / 2, angle: CGFloat(-3 * M_PI_4), offset: CGPointMake(intrinsicSquareSize / 6, 0))
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line3Layer.lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(0, -intrinsicSquareSize / 6))
    case .CaretUp:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line2Layer.lineWidth / 2, angle: CGFloat(M_PI_4), offset: CGPointMake(intrinsicSquareSize / 6, 0))
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 4 - line3Layer.lineWidth / 2, angle: CGFloat(3 * M_PI_4), offset: CGPointMake(-intrinsicSquareSize / 6, 0))
    case .CircleClose:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 2)
      newCircleAlpha = 1
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2 / 1.6, angle: CGFloat(M_PI_4), offset: CGPointZero)
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2 / 1.6, angle: CGFloat(-M_PI_4), offset: CGPointZero)
    case .CirclePlus:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 2)
      newCircleAlpha = 1
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2 / 1.6, angle: CGFloat(M_PI_2), offset: CGPointZero)
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2 / 1.6, angle: 0, offset: CGPointZero)
    case .Close:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: CGFloat(M_PI_4), offset: CGPointZero)
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: CGFloat(-M_PI_4), offset: CGPointZero)
    case .Hamburger:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 1
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: 0, offset: CGPointMake(0, intrinsicSquareSize / -2 / 1.6))
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: 0, offset: CGPointMake(0, intrinsicSquareSize / 2 / 1.6))
    case .Plus:
      newCirclePath  = createCenteredCircleWithRadius(intrinsicSquareSize / 20)
      newCircleAlpha = 0
      newLine1Path   = createCenteredLineWithRadius(intrinsicSquareSize / 20, angle: 0, offset: CGPointZero)
      newLine1Alpha  = 0
      newLine2Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: CGFloat(M_PI_2), offset: CGPointZero)
      newLine3Path   = createCenteredLineWithRadius(intrinsicSquareSize / 2, angle: 0, offset: CGPointZero)
    }

    if animated {
      let configurations: [(keyPath: String, layer: CALayer, oldValue: AnyObject?, newValue: AnyObject?, key: String)] = [
        (keyPath: "path", layer: circleLayer, oldValue: circleLayer.path, newValue: newCirclePath, key: "animateCirclePath"),
        (keyPath: "opacity", layer: circleLayer, oldValue: circleLayer.opacity, newValue: newCircleAlpha, key: "animateCircleOpacityPath"),
        (keyPath: "path", layer: line1Layer, oldValue: line1Layer.path, newValue: newLine1Path, key: "animateLine1Path"),
        (keyPath: "opacity", layer: line1Layer, oldValue: line1Layer.opacity, newValue: newLine1Alpha, key: "animateLine1OpacityPath"),
        (keyPath: "path", layer: line2Layer, oldValue: line2Layer.path, newValue: newLine2Path, key: "animateLine2Path"),
        (keyPath: "path", layer: line3Layer, oldValue: line3Layer.path, newValue: newLine3Path, key: "animateLine3Path")
      ]

      for config in configurations {
        let anim                 = CABasicAnimation(keyPath: config.keyPath)
        anim.removedOnCompletion = false
        anim.fillMode            = kCAFillModeForwards
        anim.duration            = 0.2
        anim.fromValue           = config.oldValue
        anim.toValue             = config.newValue
        anim.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

        config.layer.addAnimation(anim, forKey: config.key)
      }
    }

    circleLayer.path    = newCirclePath;
    circleLayer.opacity = newCircleAlpha
    line1Layer.path     = newLine1Path
    line1Layer.opacity  = newLine1Alpha
    line2Layer.path     = newLine2Path
    line3Layer.path     = newLine3Path
  }

  internal func createCenteredCircleWithRadius(radius: CGFloat) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, centerPoint.x + radius, centerPoint.y)
    CGPathAddArc(path, nil, centerPoint.x, centerPoint.y, radius, 0, 2 * CGFloat(M_PI), false)

    return path
  }

  internal func createCenteredLineWithRadius(radius: CGFloat, angle: CGFloat, offset: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    let c = cos(angle)
    let s = sin(angle)

    CGPathMoveToPoint(path, nil, centerPoint.x + offset.x + radius * c, centerPoint.y + offset.y + radius * s)
    CGPathAddLineToPoint(path, nil, centerPoint.x + offset.x - radius * c, centerPoint.y + offset.y - radius * s)

    return path
  }

  internal func createLineFromPoint(point: CGPoint, toPoint: CGPoint) -> CGPathRef {
    let path = CGPathCreateMutable()

    CGPathMoveToPoint(path, nil, offset.x + point.x, offset.y + point.y)
    CGPathAddLineToPoint(path, nil, offset.x + toPoint.x, offset.y + toPoint.y)

    return path
  }

  // MARK: - Action Methods

  internal func highlightAction() {
    for sublayer in allLayers {
      sublayer.strokeColor = UIColor.redColor().CGColor
    }

    let anim                 = CABasicAnimation(keyPath: "transform.scale")
    anim.duration            = 0.2
    anim.removedOnCompletion = false
    anim.fillMode            = kCAFillModeForwards
    anim.toValue             = 1.2
    anim.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

    layer.addAnimation(anim, forKey: "scaleup")
  }

  internal func unhighlightAction() {
    for sublayer in allLayers {
      sublayer.strokeColor = UIColor.blackColor().CGColor
    }

    let anim                 = CABasicAnimation(keyPath: "transform.scale")
    anim.duration            = 0.2
    anim.removedOnCompletion = false
    anim.fillMode            = kCAFillModeForwards
    anim.toValue             = 1
    anim.timingFunction      = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

    layer.addAnimation(anim, forKey: "scaledown")
  }
}