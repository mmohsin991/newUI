//
//  UsersSettingVC.swift
//  newUI
//
//  Created by Mohsin on 17/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class UsersSettingVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet weak var usersTableView: UITableView!
    
    
    
    
    var tempUers = ["sa","s","fds","fds","fdsfa", "dsad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.tempUers.count
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("userCellID") as UserCell
        
        cell.imgView.image =  UIImage(named: "MemberPicture")
        cell.imgView.layer.borderWidth = 3.0
        cell.imgView.layer.cornerRadius = cell.imgView.frame.size.width/2
        cell.imgView.layer.masksToBounds = true
        cell.imgView.layer.borderColor = UIColor.grayColor().CGColor
        

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70.0
    }
    

}


class UserCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    
}
