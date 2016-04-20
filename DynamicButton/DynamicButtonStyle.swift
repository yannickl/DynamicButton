//
//  DynamicButtonStyle.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 20/04/16.
//  Copyright © 2016 Yannick LORIOT. All rights reserved.
//

import Foundation

/// The stylistic appearance of different buttons.
public struct DynamicButtonStyle {
  /// Downwards arrow: ↓
  public let ArrowDown = ButtonArrowDownPath.self

  /// Leftwards arrow: ←
  public let ArrowLeft = ButtonArrowLeftPath.self

  /// Rightwards arrow: →
  public let ArrowRight = ButtonArrowRightPath.self

  /// Upwards arrow: ↑
  public let ArrowUp = ButtonArrowUpPath.self

  /// Down caret: ⌄
  public let CaretDown = ButtonCaretDownPath.self

  /// Left caret: ‹
  public let CaretLeft = ButtonCaretLeftPath.self

  /// Left caret: ›
  public let CaretRight = ButtonCaretRightPath.self

  /// Up caret: ⌃
  public let CaretUp = ButtonArrowUpPath.self

  /// Check mark: ✓
  public let CheckMark = ButtonCheckMarkPath.self

  /// Close symbol surrounded by a circle
  public let CircleClose = ButtonCircleClosePath.self

  /// Plus symbol surrounded by a circle
  public let CirclePlus = ButtonCirclePlusPath.self

  /// Close symbol: X
  public let Close = ButtonClosePath.self

  /// Dot symbol: .
  public let Dot = ButtonDotPath.self

  /// Downwards triangle-headed arrow to bar: ⭳ \{U+2B73}
  public let Download = ButtonDownloadPath.self

  /// Fast forward: ≫
  public let FastForward = ButtonFastForwardPath.self

  /// Hamburger button: ≡
  public let Hamburger = ButtonHamburgerPath.self

  /// Horizontal line: ―
  public let HorizontalLine = ButtonHorizontalLinePath.self

  /// No style
  public let None = ButtonNonePath.self

  /// Pause symbol: ‖
  public let Pause = ButtonPausePath.self

  /// Play symbol: ► \{U+25B6}
  public let Play = ButtonPlayPath.self

  /// Plus symbol: +
  public let Plus = ButtonPlusPath.self

  /// Rewind symbol: ≪
  public let Rewind = ButtonRewindPath.self

  /// Stop symbol: ◼ \{U+2588}
  public let Stop = ButtonStopPath.self

  /// Vertical line: |
  public let VerticalLine = ButtonVerticalLinePath.self
}