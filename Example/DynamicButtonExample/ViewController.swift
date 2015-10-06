//
//  ViewController.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 06/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, DynamicButtonCellDelegate {
  @IBOutlet weak var dynamicButtonCollectionView: UICollectionView!
  @IBOutlet weak var dynamicButton: DynamicButton!

  private let CellIdentifier = "DynamicButtonCell"

  override func viewDidLoad() {
    super.viewDidLoad()

    dynamicButton.lineWidth = 3
  }

  // MARK: - UICollectionView DataSource Methods

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DynamicButton.Style.allValues.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath) as! DynamicButtonCellView

    cell.buttonStyle         = DynamicButton.Style.allValues[indexPath.row]
    cell.lineWidth           = 3
    cell.highlightStokeColor = UIColor.grayColor()
    cell.delegate            = self

    return cell
  }

  // MARK: - DynamicButtonCell Delegate Methods

  func styleDidSelected(style: DynamicButton.Style) {
    dynamicButton.setStyle(style, animated: true)
  }
}

