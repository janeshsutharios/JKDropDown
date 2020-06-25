//  Created by janesh suthar on 7/4/17.
import UIKit
//declare protocol to return selected row
protocol JKDropDownDelegate {
    func recievedSelectedValue(name:String,imageName:String)
}

class JKDropDown: UIView{
    let KCell = "cell"
    var dropDelegate:JKDropDownDelegate?
    var tblView: UITableView?
    var btnSender = UIButton ()
    var arrayDataList : [String] = []
    var arrayImageList : [String] = []
    var animationDirection  = DirectionOfDropDown.down
    // TableView Initialization.
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initTable()
    }
    
    func initTable(){
        self.tblView = UITableView ()
        self.tblView?.register(UITableViewCell.self, forCellReuseIdentifier: KCell)
        self.addSubview(self.tblView!)
        self.tblView?.delegate=self
        self.tblView?.dataSource=self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // This method call where tableview(dropdown) appears
    func showJKDropDown(senderObject : UIButton,
                        height: CGFloat,
                        arrayList:[String],
                        arrayImages:[String],
                        buttonFrame: CGRect,
                        direction:DirectionOfDropDown) {
        self.btnSender = senderObject
        let btnFrame = senderObject.frame
        arrayDataList = arrayList
        arrayImageList = arrayImages
        animationDirection = direction
        self.frame = CGRect(x:buttonFrame.origin.x,
                            y:buttonFrame.origin.y+buttonFrame.size.height,
                            width:buttonFrame.size.width,
                            height:0)
        self.layer.shadowOffset = CGSize(width:-5, height:5)
        self.layer.masksToBounds = false;
        self.layer.cornerRadius = 8;
        self.layer.shadowRadius = 5;
        self.layer.shadowOpacity = 0.5;
        self.tblView?.layer.cornerRadius = 5
        self.tblView?.separatorStyle = .singleLine
        self.tblView?.separatorColor = .black
        self.tblView?.layoutMargins = .zero
        self.tblView?.separatorInset = .zero
        // Based on direction the dropdown will draws
        if direction == .down {
            self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y + buttonFrame.size.height ,  width:btnFrame.width, height:height)
        } else {
            self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y - buttonFrame.size.height ,  width:btnFrame.width, height:height)
        }
        self.tblView?.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:0)
        self.tblView?.reloadData()
        senderObject.superview?.addSubview(self)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            if direction == .down {
                self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y + buttonFrame.size.height ,  width:btnFrame.width, height:height)
            } else {
                self.frame = CGRect(x:buttonFrame.origin.x, y:  buttonFrame.origin.y - height ,  width:btnFrame.width, height:height)
            }
            self.tblView?.frame = CGRect(x:0, y:0, width:buttonFrame.width, height:height)
        }, completion: nil)
    }
    
    func hideDropDown(senderObject:UIButton,buttonFrame: CGRect){
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
            if self.animationDirection == .down {
                self.frame = CGRect(x:buttonFrame.origin.x, y: buttonFrame.origin.y + senderObject.frame.height, width:buttonFrame.width, height:0)
            } else {
                self.frame = CGRect(x:buttonFrame.origin.x, y:buttonFrame.origin.y, width:buttonFrame.width, height:0)
            }
            self.tblView?.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:0)
        }, completion:{ Void in
            self.removeFromSuperview()
        })
    }
}


//MARK:- TableView DataSource & Delegate Methods..

extension JKDropDown : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KCell)!
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = arrayDataList[indexPath.row]
        if arrayImageList.count == arrayDataList.count {
            cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
        } else if arrayImageList.count > arrayDataList.count {
            if indexPath.row < arrayImageList.count {
                cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
            }
        } else if arrayImageList.count < arrayDataList.count {
            if indexPath.row < arrayImageList.count {
                cell.imageView?.image = UIImage(named: arrayImageList[indexPath.row])
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for subview: UIView in btnSender.subviews {
            if (subview is UIImageView) {
                subview.removeFromSuperview()
            }
        }
        if indexPath.row < arrayImageList.count {
            dropDelegate?.recievedSelectedValue(name: arrayDataList[indexPath.row], imageName: arrayImageList[indexPath.row])
            return
        }
        dropDelegate?.recievedSelectedValue(name: arrayDataList[indexPath.row], imageName: "")
    }
}

enum DirectionOfDropDown: String {
    case up
    case down
}
