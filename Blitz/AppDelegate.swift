//
//  AppDelegate.swift
//  Blitz
//
//  Created by Umut Bozkurt on 03/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import CoreLocation
import Onboard


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate
{

    var window: UIWindow?
    let userOnboardedKey = "userIsOnboarded"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let userIsOnboarded = NSUserDefaults.standardUserDefaults().boolForKey(userOnboardedKey)
        
        if !userIsOnboarded
        {
            onBoard()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: userOnboardedKey)
        }
        
        return true
    }
    
    func setupNavigationConroller()
    {
        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }
    
    func onBoard()
    {
        window?.rootViewController = OnboardingContainerViewController(completionHandler: { (onboardingController) -> Void in
            self.setupNavigationConroller()
        })
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        
    }
}

