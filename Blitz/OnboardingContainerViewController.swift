//
//  OnboardingViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 06/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import Onboard

class OnboardingContainerViewController: OnboardingViewController
{
    let maxWidth: CGFloat = 360
    
    init(completionHandler: (onboardingController: OnboardingContentViewController) -> Void)
    {
        let contents = [
            FirstOnboardingViewController(),
            SecondOnboardingViewController(),
            ThirdOnboardingViewController()
        ]
        
        (contents.last as! ThirdOnboardingViewController).finishOnboardingHandler = completionHandler
        
        super.init(backgroundImage: nil, contents: contents)
        
        topPadding += UIScreen.mainScreen().bounds.size.height / 5
        bottomPadding += UIScreen.mainScreen().bounds.size.height / 12
        
        iconHeight = 128 + (UIScreen.mainScreen().bounds.size.width - maxWidth) / 2
        iconWidth = 128 + (UIScreen.mainScreen().bounds.size.width - maxWidth) / 2
        
        shouldMaskBackground = false
        fadePageControlOnLastPage = true
        
        titleFontName = "BrandonGrotesque-Black"
        titleFontSize = 50
        
        bodyFontName = "BrandonGrotesque-Regular"
        bodyFontSize = 30
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.LightContent
    }
}
