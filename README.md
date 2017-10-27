# JKDropDown ios Swift dropdwon menu
JKDropDown is simple light weight Swift dropdown

<p align="center"><img src="https://media.giphy.com/media/26zznaPmDV0As4812/giphy.gif" width="242" height="425"/></p>

## Features

- We can use dropdown easy in/out animation with up/down direction:
``
      dropDownObject.showJKDropDown(senderObject: buttonSelect, height: 180, arrayList: arrayIs , arrayImages: imageArray,buttonFrame:buttonFrame!,direction : "down")// you can set "up"
  ``

## Usage
Import Localize at the top of each Swift file that will contain localized text.
Add `JKDropDownDelegate` in your Class:
```swift
class ViewController: UIViewController,JKDropDownDelegate {}
```
Create CGRect variable which is used to getting Button frame:
```
 var buttonFrame : CGRect?
 ```
 Create  JKDropDown object
 ```
 var dropDownObject:JKDropDown!
 ```
 Assign values to `buttonFrame` with parent view:
 ```
 buttonFrame = view.convert(buttonSelect.frame, to: view)//view is parent view (self.view)
```
### Setting up with [CocoaPods](https://cocoapods.org/pods/JKDropDown)
```ruby
source 'https://github.com/janeshsutharios/JKDropDown.git'
pod 'JKDropDown', :git => 'https://github.com/janeshsutharios/JKDropDown-ios-swift-dropdown-menu.git'
```
## Example usage

```
import UIKit
class ViewController: UIViewController,JKDropDownDelegate {
    @IBOutlet weak var buttonSelect : UIButton!
    var buttonFrame : CGRect?
    var dropDownObject:JKDropDown!
    var arrayIs : [String] = ["Edit","Love","Music","Location"]
    let imageArray = ["1","2","3","4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSelect.addTarget(self, action: #selector(tapsOnButton), for: UIControlEvents.touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        buttonFrame = view.convert(buttonSelect.frame, to: view)
    }
    func tapsOnButton() {
        if dropDownObject == nil {
            dropDownObject = JKDropDown()
            dropDownObject.dropDelegate = self
            dropDownObject.showJKDropDown(senderObject: buttonSelect, height: 180, arrayList: arrayIs , arrayImages: imageArray,buttonFrame:buttonFrame!,direction : "down")
            view.addSubview(dropDownObject)
            
        }
        else {
            dropDownObject.hideDropDown(senderObject: buttonSelect,buttonFrame:buttonFrame!)
            dropDownObject = nil
        }
    }
    func recievedSelectedValue(name: String, imageName: String) {
        dropDownObject.hideDropDown(senderObject: buttonSelect, buttonFrame: buttonFrame!)
        dropDownObject = nil
        buttonSelect.setTitle(name, for: .normal)
        var imageView : UIImageView?
        imageView = UIImageView(image: UIImage(named:imageName))
        imageView?.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
        buttonSelect.addSubview(imageView!)
    }
}
```
## License

JKDropDown is released under the MIT license. [See LICENSE](https://github.com/janeshsutharios/JKDropDown/blob/master/LICENSE) for details.
