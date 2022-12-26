# HanoAlert
![iOS badge](https://img.shields.io/badge/SPM-supported-red) ![iOS badge](https://img.shields.io/badge/license-MIT-lightgrey) ![iOS badge](https://img.shields.io/badge/platform-iOS-lightgrey)

<br/></br>
![HanoAlert](https://user-images.githubusercontent.com/88874280/208947135-2d2336fd-d9a1-46fd-91a7-972090745945.gif)

- A simple Alert to the view..

<br/></br>
## Example
```swift
//One Button Alert
HanoAlert(title: "Title", message: "Message", confirm: "OK", buttonStyle: .oneButton, completionHandler: nil)
            .showAlert(view)
    
//Two Button Alert
HanoAlert(title: "Title", message: "Message", confirm: "OK", cancel: "Cancel", buttonStyle: .twoButton, completionHandler: nil)
            .showAlert(view)
```

<br/></br>
## Requirements
- iOS 13.0
- Swift 5

<br/></br>
## Installation

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
