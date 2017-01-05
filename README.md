# FYNotification

[![CI Status](http://img.shields.io/travis/fish-yan/FYNotification.svg?style=flat)](https://travis-ci.org/fish-yan/FYNotification)
[![Version](https://img.shields.io/cocoapods/v/FYNotification.svg)](http://cocoapods.org/pods/FYNotification)
[![License](https://img.shields.io/cocoapods/l/FYNotification.svg?style=flat)](http://cocoapods.org/pods/FYNotification)
[![Platform](https://img.shields.io/cocoapods/p/FYNotification.svg?style=flat)](http://cocoapods.org/pods/FYNotification)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FYNotification is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FYNotification"
```

##How to use

configure notification style

```swift
/** configure notification
  * 
 */
FYNotification.configure(backgroundColor: UIColor.black, textColor:UIColor.white, fontSize: 15)
```

add a notification with statsu, duration and message
```swift
/** show notification
  * status: FYNotificationStatus (success, error, warning, other. other hasn't status image)
  * message: String
  * duration: TimeInterval (Notification display time)
 */
FYNotification.show(status: .success, message: "操作成功", duration: 2)
```

dismiss notification
```swift
/** notification disappear immediately
  *
 */
FYNotification.dismiss()
```

## Author

fish-yan, 757094197@qq.com

## License

FYNotification is available under the MIT license. See the LICENSE file for more info.
