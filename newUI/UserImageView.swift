//
//  UserImage.swift
//  newUI
//
//  Created by Mohsin on 17/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class UserImageView: UIImageView {
    
    var isCheckedIn = false
    
    override init(){
        super.init()
    }
    
    init(image : UIImage, isCheckedIn: Bool){
        super.init(image: image)
        
        self.layer.cornerRadius = image.size.width/2
        self.layer.borderWidth = 3.0
        if isCheckedIn{
            self.layer.borderColor = UIColor.greenColor().CGColor
        }
        else{
            self.layer.borderColor = UIColor.redColor().CGColor
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    
}