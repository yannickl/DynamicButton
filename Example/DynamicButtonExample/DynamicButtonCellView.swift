//
//  DynamicButtonCellView.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 13/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

protocol DynamicButtonCellDelegate: class {
  func styleDidSelected(style: DynamicButtonStyle.Type)
}

class DynamicButtonCellView: UICollectionViewCell {
  @IBOutlet weak var dynamicButton: DynamicButton!

  weak var delegate: DynamicButtonCellDelegate?

  var buttonStyle: DynamicButtonStyle.Type = DynamicButtonStyleHamburger.self {
    didSet {
      dynamicButton.setStyle(buttonStyle, animated: false)
    }
  }

  var lineWidth: CGFloat = 2 {
    didSet {
      dynamicButton.lineWidth = lineWidth
    }
  }

  var strokeColor: UIColor = UIColor.blackColor() {
    didSet {
      dynamicButton.strokeColor = strokeColor
    }
  }

  var highlightStokeColor: UIColor? = nil {
    didSet {
      dynamicButton.highlightStokeColor = highlightStokeColor
    }
  }

  // MARK: - UIFocusEnvironment Methods
  weak override var preferredFocusedView: UIView? {
    get {
      return dynamicButton
    }
  }

  // MARK: - Action Methods

  @IBAction func dynamicButtonAction(sender: AnyObject) {
    delegate?.styleDidSelected(buttonStyle)
  }
}
