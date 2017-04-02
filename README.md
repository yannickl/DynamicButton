![DynamicButton](http://yannickloriot.com/resources/dynamicbutton-header.png)

[![Supported Platforms](https://cocoapod-badges.herokuapp.com/p/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) [![Version](https://cocoapod-badges.herokuapp.com/v/DynamicButton/badge.svg)](http://cocoadocs.org/docsets/DynamicButton/) <a href="https://github.com/Carthage/Carthage"><img alt="Carthage compatible" src="https://img.shields.io/badge/Carthage-%E2%9C%93-brightgreen.svg?style=flat"/></a>
  <a href="https://github.com/apple/swift-package-manager"><img alt="Swift Package Manager compatible" src="https://img.shields.io/badge/SPM-%E2%9C%93-brightgreen.svg?style=flat"/></a> [![Build Status](https://travis-ci.org/yannickl/DynamicButton.svg?branch=master)](https://travis-ci.org/yannickl/DynamicButton) [![codecov.io](http://codecov.io/github/yannickl/DynamicButton/coverage.svg?branch=master)](http://codecov.io/github/yannickl/DynamicButton?branch=master) [![codebeat badge](https://codebeat.co/badges/ed7210be-6c9d-43ff-87a0-a10c007fe1b4)](https://codebeat.co/projects/github-com-yannickl-dynamicbutton)

**DynamicButton** is a powerful flat design button written in Swift to display *hamburger button* like with animated transitions between style updates. It also allows you to create your own custom symbol / style buttons!

<p align="center">
  <img src="https://cloud.githubusercontent.com/assets/798235/20039804/d4b533ca-a44a-11e6-8d4e-07aa45ef4a76.gif" alt="DynamicButton" />
</p>

<p align="center">
    <a href="#requirements">Requirements</a> • <a href="#usage">Usage</a> • <a href="#installation">Installation</a> • <a href="#contribution">Contribution</a> • <a href="#contact">Contact</a> • <a href="#license-mit">License</a>
</p>

## Requirements

- iOS 8.0+ / tvOS 9.0+
- Xcode 8.0+
- Swift 3.1+

## Usage

### Basics

Here is how to create a button and setting its style:

```swift
import DynamicButton

let dynamicButton = DynamicButton(style: .hamburger)
// Equivalent to
// let dynamicButton   = DynamicButton()
// dynamicButton.style = .hamburger

// Animate the style update
dynamicButton.setStyle(.close, animated: true)
```

### Customization

Button appearance and behavior can be customized using different properties:

```swift
let dynamicButton                 = DynamicButton()
dynamicButton.lineWidth           = 3
dynamicButton.strokeColor         = .black
dynamicButton.highlightStokeColor = .gray
```

### Supported Symbol Styles

Here is the symbol list (`DynamicButton.Style`) already implemented by the library:

 - `.arrowDown`: downwards arrow `↓`
 - `.arrowLeft`: leftwards arrow `←`
 - `.arrowRight`: rightwards arrow `→`
 - `.arrowUp`: upwards arrow `↑`
 - `.caretDown`: down caret `⌄`
 - `.caretLeft`: left caret `‹`
 - `.caretRight`: left caret `›`
 - `.caretUp`: up caret: `⌃`
 - `.checkMark`: check mark `✓`
 - `.circleClose`: close symbol surrounded by a circle
 - `.circlePlus`: plus symbol surrounded by a circle
 - `.close`: close symbol `X`
 - `.dot`: dot symbol `.`
 - `.download`: downwards triangle-headed arrow to bar `⤓`
 - `.fastForward`: fast forward `≫`
 - `.hamburger`: hamburger button `≡`
 - `.horizontalLine`: horizontal line `―`
 - `.horizontalMoreOptions`: horizontal more options `…`
 - `.none`: no style
 - `.pause`: pause symbol `‖`
 - `.play`: play symbol `►`
 - `.plus`: plus symbol `+`
 - `.stop`: stop symbol `◼`
 - `.reload`: reload symbol `↻`
 - `.rewind`: rewind `≪`
 - `.verticalLine`: vertical line `|`
 - `.verticalMoreOptions`: vertical more options `⋮`

### Custom symbol

To create your own symbols you have to create an object (or struct) that conforms to the `DynamicButtonBuildableStyle` protocol:

```swift
/// Diagonal line style: \
struct MyCustomLine: Style, DynamicButtonBuildable {
  let pathVector: DynamicButtonPathVector

  init(center: CGPoint, size: CGFloat, offset: CGPoint, lineWidth: CGFloat) {
    let r = size / 2
    let c = cos(CGFloat.pi * 0.3)
    let s = sin(CGFloat.pi * 0.3)

    let p1 = CGMutablePath()
    p1.move(to: CGPoint(x: center.x + r * c, y: center.y + r * s))
    p1.addLine(to: CGPoint(x: center.x - r * c, y: center.y - r * s))

    pathVector = DynamicButtonPathVector(p1: p1, p2: p1, p3: p1, p4: p1)
  }

  /// "MyCustomLine" style.
  static var styleName: String {
    return "MyCustomLine"
  }
}

let myButton.style = .custom(MyCustomLine.self)
```

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
pod 'DynamicButton', '~> 4.0.0'
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
github "yannickl/DynamicButton" >= 4.0.0
```

#### Swift Package Manager

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `DynamicButton` by adding the proper description to your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/yannickl/DynamicButton.git", versions: "4.0.0" ..< Version.max)
    ]
)
```

Note that the [Swift Package Manager](https://swift.org/package-manager) is still in early design and development, for more information checkout its [GitHub Page](https://github.com/apple/swift-package-manager).

#### Manually

[Download](https://github.com/YannickL/DynamicButton/archive/master.zip) the project and copy the `DynamicButton` folder into your project to use it in.

## Contribution

Contributions are welcomed and encouraged *♡*.

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
