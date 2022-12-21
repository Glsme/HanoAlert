# HanoAlert
 [![SwiftPM](https://img.shields.io/badge/SPM-supported-DE5C43.svg?style=flat)](https://swift.org/package-manager/) [![License](https://img.shields.io/cocoapods/l/HanoAlert.svg?style=flat)](https://cocoapods.org/pods/HanoAlert) [![Platform](https://img.shields.io/cocoapods/p/HanoAlert.svg?style=flat)](https://cocoapods.org/pods/HanoAlert)

<br/></br>
![HanoAlert](https://user-images.githubusercontent.com/88874280/208947135-2d2336fd-d9a1-46fd-91a7-972090745945.gif)

- A simple Alert to the view..

<br/></br>
## Example
```swift
//One Button Alert
HanoAlert(title: "Title", message: "Message", confirm: "OK", font: nil, buttonStyle: .oneButton, completionHandler: nil)
            .showAlert(view)
    
//Two Button Alert
HanoAlert(title: "Title", message: "Message", confirm: "OK", cancel: "Cancel", font: nil, buttonStyle: .twoButton, completionHandler: nil)
            .showAlert(view)
```

<br/></br>
## Requirements
- iOS 13.0
- Swift 5

<br/></br>
## Installation

### CocoaPods

YMLogoAlert is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HanoAlert'
```

### Swift Package Manager
```ruby
https://github.com/Glsme/HanoAlert.git
```
<br/></br>
## Author

- **Glsme (Hano)**
- E-mail: glasses.str.man@gmail.com
<br/></br>
## License

HanoAlert is available under the MIT license. See the LICENSE file for more info.
<br/></br>
