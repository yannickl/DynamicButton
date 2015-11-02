![DynamicButton](http://yannickloriot.com/resources/dynamicbutton-header.png)

[![Supported Platforms](https://cocoapod-badges.herokuapp.com/p/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Version](https://cocoapod-badges.herokuapp.com/v/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/yannickl/DynamicButton.png?branch=master)](https://travis-ci.org/yannickl/DynamicButton)

DynamicButton is a powerful flat design button written in Swift to display *hamburger button* like with animated transitions between style updates.

![DynamicButton](http://yannickloriot.com/resources/dynamicbutton.gif)

**Notes: compatible iOS 8.x and over and tvOS 9.x**

## Usage

### Basics

Here is how to create a button and setting its style:

```swift
import DynamicButton

let dynamicButton = DynamicButton(style: .Hamburger)
// Equivalent to
// let dynamicButton   = DynamicButton()
// dynamicButton.style = .Hamburger

// Animate the style update
dynamicButton.setStyle(.Close, animated: true)
```

### Customization

Button appearance and behavior can be customized using different properties:

```swift
let dynamicButton                 = DynamicButton()
dynamicButton.lineWidth           = 3
dynamicButton.strokeColor         = UIColor.blackColor()
dynamicButton.highlightStokeColor = UIColor.grayColor()
```

### Supported Symbol Styles

Here is the symbol list supported by the library:

```swift
enum Style {
    case ArrowDown      // Downwards arrow: ↓
    case ArrowLeft      // Leftwards arrow: ←
    case ArrowRight     // Rightwards arrow: →
    case ArrowUp        // Upwards arrow: ↑
    case CaretDown      // Down caret: ⌄
    case CaretLeft      // Left caret: ‹
    case CaretRight     // Left caret: ›
    case CaretUp        // Up caret: ⌃
    case CheckMark      // Check mark: ✓
    case CircleClose    // Close symbol surrounded by a circle
    case CirclePlus     // Plus symbol surrounded by a circle
    case Close          // Close symbol: X
    case Download       // Downwards triangle-headed arrow to bar: ⭳ \{U+2B73}
    case FastForward    // Fast forward: ≫
    case Hamburger      // Hamburger button: ≡
    case HorizontalLine // Horizontal line: ―
    case Pause          // Pause symbol: ‖
    case Plus           // Plus symbol: +
    case Rewind         // Rewind: ≪
    case VerticalLine   // Vertical line: |
  }
```

*Note: All contribution to add new symbol is welcome*

### And many more...

To go further, take a look at the example project.

## Installation

#### CocoaPods

Install CocoaPods if not already available:

``` bash
$ [sudo] gem install cocoapods
$ pod setup
```
Go to the directory of your Xcode project, and Create and Edit your Podfile and add _DynamicButton_:

``` bash
$ cd /path/to/MyProject
$ touch Podfile
$ edit Podfile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

use_frameworks!
pod 'DynamicButton', '~> 1.2.0'
```

Install into your project:

``` bash
$ pod install
```

Open your project in Xcode from the .xcworkspace file (not the usual project file):

``` bash
$ open MyProject.xcworkspace
```

You can now `import DynamicButton` framework into your files.

#### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that automates the process of adding frameworks to your Cocoa application.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate `DynamicButton` into your Xcode project using Carthage, specify it in your `Cartfile` file:

```ogdl
github "yannickl/DynamicButton" >= 1.2.0
```

#### Manually

[Download](https://github.com/YannickL/DynamicButton/archive/master.zip) the project and copy the `DynamicButton` folder into your project to use it in.

## Contact

Yannick Loriot
 - [https://twitter.com/yannickloriot](https://twitter.com/yannickloriot)
 - [contact@yannickloriot.com](mailto:contact@yannickloriot.com)


## License (MIT)

Copyright (c) 2015-present - Yannick Loriot

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
