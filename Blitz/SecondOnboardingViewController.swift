//
//  FirstOnboardingViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 06/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import Onboard

class SecondOnboardingViewController: OnboardingContentViewController
{
    init()
    {
        let title = "Pins & Photos"
        let body = "Add location pins with photos, and take notes."
        
        super.init(title: title, body: body, image: UIImage.logoImage(), buttonText: nil, action: nil)
        view.backgroundColor = UIColor.blitzLightBlueColor()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
