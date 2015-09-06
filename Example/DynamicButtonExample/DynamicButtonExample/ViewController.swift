//
//  ViewController.swift
//  DynamicButtonExample
//
//  Created by Yannick LORIOT on 06/09/15.
//  Copyright (c) 2015 Yannick LORIOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var hamburgerButton: DynamicButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  // MARK: - Action Methods
  
  @IBAction func hamburgerAction(sender: AnyObject) {
    hamburgerButton.setStyle(.Close, animated: true)
  }
}

