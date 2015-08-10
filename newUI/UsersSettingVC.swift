//
//  UsersSettingVC.swift
//  newUI
//
//  Created by Mohsin on 17/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

let kGreenColor = UIColor(red: 48/256, green: 168/256, blue: 89/256, alpha: 1.0)


class UsersSettingVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate , UIPopoverPresentationControllerDelegate{

    
    
    @IBOutlet weak var usersTableView: UITableView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var btnBottomViewArr: [UIView]!
    
    @IBOutlet var btnArr: [UIButton]!

    @IBOutlet weak var searchTxt: UITextField!
    
    @IBOutlet weak var btnSearchType: UIButton!
    
    
    var tempUers = ["sa","s","fds","fds","fdsfa", "dsad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.scrollView.contentSize.width = 460
        
        self.searchTxt.layer.borderWidth = 3
        self.searchTxt.layer.borderColor = UIColor.whiteColor().CGColor
        self.searchTxt.layer.cornerRadius = 3.0
        
        
        self.searchTxt.layer.shadowColor = UIColor.grayColor().CGColor
        self.searchTxt.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.searchTxt.layer.shadowOpacity = 0.5
        self.searchTxt.layer.shadowRadius = 0.5
        self.searchTxt.layer.masksToBounds = false
        
        
        
        self.btnSearchType.layer.cornerRadius = 5
        self.btnSearchType.layer.borderWidth = 1
        self.btnSearchType.layer.borderColor = UIColor.whiteColor().CGColor
        
        self.btnSearchType.layer.shadowRadius = 0.5
        self.btnSearchType.layer.shadowOpacity = 0.5
        self.btnSearchType.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.btnSearchType.layer.shadowColor = UIColor.grayColor().CGColor
        
        self.btnSearchType.layer.masksToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.tempUers.count
    }
    
    // dedigated to UI
    @IBAction func forUIAction(sender: UIButton) {
        
        for x in 0..<self.btnBottomViewArr.count {
            self.btnBottomViewArr[x].backgroundColor = UIColor.grayColor()
            self.btnArr[x].setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        }
        
        sender.setTitleColor(kGreenColor, forState: UIControlState.Normal)
        self.btnBottomViewArr[sender.tag].backgroundColor = kGreenColor
        
    }
    
    @IBAction func touchSearchTxt(sender: UITextField) {
        if sender.text != "" {
            sender.text = ""
            sender.textColor = UIColor.blackColor()
        }
    }
    
    @IBAction func touchEndSearchTxt(sender: UITextField) {
        if sender.text == "" {
            sender.textColor = UIColor.grayColor()
            sender.text = "🔍 Find By Name, Phone or email"
        }
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("userCellID") as UserCell
        
        //cell.imgView.image =  UIImage(named: "MemberPicture")
        cell.imgView.layer.borderWidth = 3.0
        cell.imgView.layer.cornerRadius = cell.imgView.frame.size.width/2
        cell.imgView.layer.masksToBounds = true
        cell.imgView.layer.borderColor = UIColor.grayColor().CGColor
        cell.btnOption.tag = indexPath.row

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    
    
    // for popover VC
    @IBAction func option(sender: UIButton) {
        println(sender.tag)
        
        var optionCV = storyboard!.instantiateViewControllerWithIdentifier("OptionVCID") as? OptionsTVC
        
        optionCV?.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        let popoverOptionCV = optionCV?.popoverPresentationController
        popoverOptionCV?.permittedArrowDirections = UIPopoverArrowDirection.Unknown
        popoverOptionCV?.delegate = self
        
        popoverOptionCV?.sourceView = sender
        
        
        self.presentViewController(optionCV!, animated: true, completion: nil)
    }
    
//
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        
//        // select the device
//        selectedDeviceName = sortedDevices[indexPath.row]
//        
//        let cell = collectionView.cellForItemAtIndexPath(indexPath) as  DeviceCell
//        
//        
//        let selectedDeviceImgName = homeArchGloble[self.selectedRoomName!]![cell.lblName.text!]
//        
//        
//        //cell.backgroundColor = UIColor.lightGrayColor()
//        
//        var menuViewController = storyboard!.instantiateViewControllerWithIdentifier("deviceVCID") as? DeviceVC
//        
//        
//        menuViewController?.modalPresentationStyle = .Popover
//        menuViewController?.preferredContentSize = CGSizeMake(260, 340)
//        
//        
//        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as DeviceCell
//        
//        menuViewController?.imgDeviceVARString = selectedDeviceImgName!
//        menuViewController?.nameVAR = selectedDeviceName
//        
//        
//        
//        let popoverMenuViewController = menuViewController?.popoverPresentationController
//        popoverMenuViewController?.permittedArrowDirections = UIPopoverArrowDirection.allZeros
//        popoverMenuViewController?.delegate = self
//        popoverMenuViewController?.sourceView = self.view
//        
//        
//        // calculate center for popover
//        let x = self.view.center.x - 130.0
//        let y = self.view.center.y - 170.0
//        
//        popoverMenuViewController?.sourceRect = CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: 260.0, height: 340.0))
//        
//        
//        //popoverMenuViewController?.sourceRect = CGRect(x: 65.0, y: self.view.frame.width/3.2, width: 260.0, height: 340.0)
//        
//        
//        presentViewController( menuViewController!, animated: true, completion: nil)
//        
//        
//    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}


class UserCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var btnOption: UIButton!
    
    
    
}
