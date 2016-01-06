//
//  ThirdOnboardingViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 06/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import CoreLocation
import Onboard
import pop

class ThirdOnboardingViewController: OnboardingContentViewController
{
    let manager = CLLocationManager()
    var finishOnboardingHandler: ((onboardingController: OnboardingContentViewController) -> Void)?
    
    init()
    {
        let title = "Location Services"
        let body = "Blitz needs permission to access your location whenever necessary."
        
        super.init(title: title, body: body, image: UIImage.logoImage(), buttonText: "Ask for Permission", action: nil)
        buttonActionHandler = { () -> Void in
            if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined
            {
                self.manager.delegate = UIApplication.sharedApplication().delegate as! AppDelegate
                self.manager.requestWhenInUseAuthorization()
            }
            
            self.finishOnboardingHandler?(onboardingController: self)
        }
        view.backgroundColor = UIColor.blitzLightBlueColor()
        
        let button = view.subviews.filter { (subview) -> Bool in
            return subview.isMemberOfClass(UIButton)
        }.first as! UIButton
        
        button.titleLabel?.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        button.center = CGPoint(x: button.center.x, y: button.center.y - UIScreen.mainScreen().bounds.size.height / 10)
        
        viewDidAppearBlock = { () -> Void in
            UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                button.backgroundColor = UIColor.blitzDarkBlueColor()
                button.layer.cornerRadius = 20
                }, completion: nil)
        }
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
