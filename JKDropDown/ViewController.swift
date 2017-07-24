//  Created by janesh suthar on 7/4/17.
//
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

