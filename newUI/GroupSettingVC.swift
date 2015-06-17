//
//  GroupSettingVC.swift
//  newUI
//
//  Created by Mohsin on 17/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class GroupSettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if self.navigationController?.navigationItem.leftBarButtonItem != nil {
            self.navigationItem.leftBarButtonItem?.image = UIImage(named: "NotificationIcon")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
