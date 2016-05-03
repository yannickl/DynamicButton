![DynamicButton](http://yannickloriot.com/resources/dynamicbutton-header.png)

[![License](https://cocoapod-badges.herokuapp.com/l/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Supported Platforms](https://cocoapod-badges.herokuapp.com/p/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Version](https://cocoapod-badges.herokuapp.com/v/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![Build Status](https://travis-ci.org/yannickl/DynamicButton.svg?branch=master)](https://travis-ci.org/yannickl/DynamicButton) [![codecov.io](http://codecov.io/github/yannickl/DynamicButton/coverage.svg?branch=master)](http://codecov.io/github/yannickl/DynamicButton?branch=master) [![codebeat badge](https://codebeat.co/badges/ed7210be-6c9d-43ff-87a0-a10c007fe1b4)](https://codebeat.co/projects/github-com-yannickl-dynamicbutton)

DynamicButton is a powerful flat design button written in Swift to display *hamburger button* like with animated transitions between style updates. It also allows you to create your own custom symbol / style buttons!

![DynamicButton](http://yannickloriot.com/resources/dynamicbutton.gif)

*Notes: compatible iOS 8.x and over and tvOS 9.x*

## Usage

### Basics

Here is how to create a button and setting its style:

```swift
import DynamicButton

let dynamicButton = DynamicButton(style: DynamicButtonStyle.Hamburger)
// Equivalent to
// let dynamicButton   = DynamicButton()
// dynamicButton.style = DynamicButtonStyle.Hamburger

// Animate the style update
dynamicButton.setStyle(DynamicButtonStyle.Close, animated: true)
```

### Customization

Button appearance and behavior can be customized using different properties:

```swift
let dynamicButton                 = DynamicButton()
dynamicButton.lineWidth           = 3
dynamicButton.strokeColor         = .blackColor()
dynamicButton.highlightStokeColor = .grayColor()
```

### Supported Symbol Styles

Here is the symbol list already implemented by the library:

```swift
DynamicButtonStyle.ArrowDown      // Downwards arrow: ↓
DynamicButtonStyle.ArrowLeft      // Leftwards arrow: ←
DynamicButtonStyle.ArrowRight     // Rightwards arrow: →
DynamicButtonStyle.ArrowUp        // Upwards arrow: ↑
DynamicButtonStyle.CaretDown      // Down caret: ⌄
DynamicButtonStyle.CaretLeft      // Left caret: ‹
DynamicButtonStyle.CaretRight     // Left caret: ›
DynamicButtonStyle.CaretUp        // Up caret: ⌃
DynamicButtonStyle.CheckMark      // Check mark: ✓
DynamicButtonStyle.CircleClose    // Close symbol surrounded by a circle
DynamicButtonStyle.CirclePlus     // Plus symbol surrounded by a circle
DynamicButtonStyle.Close          // Close symbol: X
DynamicButtonStyle.Dot            // Dot symbol: .
DynamicButtonStyle.Download       // Downwards triangle-headed arrow to bar: ⭳ \{U+2B73}
DynamicButtonStyle.FastForward    // Fast forward: ≫
DynamicButtonStyle.Hamburger      // Hamburger button: ≡
DynamicButtonStyle.HorizontalLine // Horizontal line: ―
DynamicButtonStyle.None           // No style
DynamicButtonStyle.Pause          // Pause symbol: ‖
DynamicButtonStyle.Play           // Play symbol: ►
DynamicButtonStyle.Plus           // Plus symbol: +
DynamicButtonStyle.Stop           // Stop symbol: ◼
DynamicButtonStyle.Reload         // Reload symbol: ↻
DynamicButtonStyle.Rewind         // Rewind: ≪
DynamicButtonStyle.VerticalLine   // Vertical line: |
```

*Note: All contribution to add new symbol is welcome*

### Custom symbol

To create your own symbols you have to create an object that inherit of the `DynamicButtonStyle` and override the designated init:

```swift
/// Vertical line style: |
class MyCustomVerticalLine: DynamicButtonStyle {
  convenience required public init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let p1 = PathHelper.lineAtCenter(center, radius: size / 2, angle: PathHelper.F_PI_2)

    self.init(path1: p1, path2: p1, path3: p1, path4: p1)
  }
}

let myButton = DynamicButton(style: MyCustomVerticalLine.self)
```

Here the `PathHelper` class is an utility to build more easily the paths. You can checkout the implemented symbols to understand how it works.

Note that a symbol can not have more than 4 paths.

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
pod 'DynamicButton', '~> 2.1.0'
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
github "yannickl/DynamicButton" >= 2.1.0
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
