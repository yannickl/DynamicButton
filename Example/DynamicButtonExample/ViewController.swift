//
//  ViewController.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 06/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DynamicButtonCellDelegate {
  @IBOutlet weak var dynamicButtonCollectionView: UICollectionView!
  @IBOutlet weak var dynamicButton: DynamicButton!

  private let CellIdentifier = "DynamicButtonCell"

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    dynamicButton.highlightBackgroundColor = .redColor()
    dynamicButton.layer.cornerRadius = dynamicButton.bounds.width / 2
  }

  // MARK: - UICollectionView DataSource Methods

  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DynamicButton.Style.allValues.count
  }

  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifier, forIndexPath: indexPath) as! DynamicButtonCellView

    cell.buttonStyle = DynamicButton.Style.allValues[indexPath.row]
    cell.delegate    = self

    return cell
  }

  func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }

  // MARK: - DynamicButtonCell Delegate Methods

  func styleDidSelected(style: DynamicButton.Style) {
    dynamicButton.setStyle(style, animated: true)
  }
}

