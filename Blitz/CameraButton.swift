//
//  CameraButton.swift
//  Blitz
//
//  Created by Umut Bozkurt on 06/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import SnapKit

class CameraButton: UIButton
{
    let width: CGFloat = 200
    let height: CGFloat = 150
    let margin: CGFloat = -100
    
    init()
    {
        super.init(frame: CGRectMake(0, 0, width, height))
        setImage(UIImage.cameraImage(), forState: UIControlState.Normal)
    }
    
    func placeUpperMiddle(ofView view: UIView)
    {
        view.addSubview(self)
        
        self.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(margin)
            make.size.equalTo(CGSizeMake(width, height))
        }
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
