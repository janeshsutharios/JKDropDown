//  Created by janesh suthar on 7/4/17.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonSelect : UIButton!
    
    var buttonFrame : CGRect?
    var dropDownObject:JKDropDown!
    var sampleArray : [String] = ["Edit","Love","Music","Location"]
    let imageArray = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSelect.addTarget(self, action: #selector(tapsOnButton), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Here we are getting button frame with respective to the self.view
        buttonFrame = view.convert(buttonSelect.frame, to: view)
    }
    // Here it shows usage of dropdown plugin.
    @objc func tapsOnButton() {
        // Based on dropDownObject we are show hide dropdown/TableView
        if dropDownObject == nil {
            dropDownObject = JKDropDown()
            dropDownObject.dropDelegate = self
            dropDownObject.showJKDropDown(senderObject: buttonSelect,
                                          height: 180,
                                          arrayList: sampleArray,
                                          arrayImages: imageArray,
                                          buttonFrame:buttonFrame!,
                                          direction : .down)
            view.addSubview(dropDownObject)
        } else {
            dropDownObject.hideDropDown(senderObject: buttonSelect,buttonFrame:buttonFrame!)
            dropDownObject = nil
        }
    }
}


//MARK: - Here we are reciving thedropdown selected values by delegate.

extension ViewController: JKDropDownDelegate {
    func recievedSelectedValue(name: String, imageName: String) {
        dropDownObject.hideDropDown(senderObject: buttonSelect, buttonFrame: buttonFrame!)
        dropDownObject = nil
        buttonSelect.setTitle(name, for: .normal)
        var imageView : UIImageView?
        imageView = UIImageView(image: UIImage(named:imageName))
        imageView?.frame = CGRect(x: 15, y: 5, width: 25, height: 25)
        buttonSelect.addSubview(imageView!)
    }
}
