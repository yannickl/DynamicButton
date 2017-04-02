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

    dynamicButton.style = .custom(MyCustomLine.self)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()

    dynamicButton.layer.cornerRadius = dynamicButton.bounds.width / 2
  }

  // MARK: - UICollectionView DataSource Methods

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DynamicButton.Style.all.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! DynamicButtonCellView

    cell.buttonStyle = DynamicButton.Style.all[indexPath.row]
    cell.delegate    = self

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
    return true
  }

  // MARK: - DynamicButtonCell Delegate Methods

  func styleDidSelected(style: DynamicButton.Style) {
    dynamicButton.setStyle(style, animated: true)
  }
}

