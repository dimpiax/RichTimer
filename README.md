# RichTimer

[![Build Status](https://travis-ci.org/dimpiax/RichTimer.svg)](http://travis-ci.org/dimpiax/RichTimer)
[![Version](https://img.shields.io/cocoapods/v/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)
[![License](https://img.shields.io/cocoapods/l/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)
[![Platform](https://img.shields.io/cocoapods/p/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)

RichTimer – it's easy NSTimer managment and compact visual appearance.
Accepts generic parameters for common functions

## Usage

This extension of NSTimer has next useful functions:
* once – timer fires after delay, not repeatable and accepts generic parameters or nothing 
* every – timer fires every delay, repeatable and accepts generic parameters or nothing 

- - - -

    // once without parameters
    Timer.once(1) {
        print("I have fired after 1 second")
    }

    // once with parameters
    Timer.once(3, arguments: (magicNumber: 4, text: "Passed text to closure")) { magicNumber, text in
        print("I have magic number: \(magicNumber) and received this: \(text)")
    }
    
    // every without parameters
    Timer.every(10) {
        print("I'm here for forever, visit every 10 second")
    }

    // every with parameters and func
    var count = 0
    var timer: NSTimer!
    
    func didFiredTimer(repeatCount: Int) {
        count += 1
        if count == repeatCount {
            print("Timer will be invalidated!")
            timer.invalidate()
        }
    }
    
    timer = Timer.every(2, arguments: 4, completion: didFiredTimer)

## Requirements

Updated to Swift 4

## Installation

RichTimer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RichTimer"
```

## Author

Pilipenko Dima, dimpiax@gmail.com

## License

RichTimer is available under the MIT license. See the LICENSE file for more info.
