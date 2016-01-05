//
//  ViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 03/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import Mapbox
import SnapKit

class HomeViewController: UIViewController, MenuButtonDataSource, MenuButtonDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let mapView = MGLMapView(frame: view.bounds)
        view.addSubview(mapView)
        
        let menuButton = MenuButton(frame: CGRectMake(0, 0, 50, 50))
        menuButton.delegate = self
        menuButton.dataSource = self
        view.addSubview(menuButton)
        
        menuButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(view).offset(-15)
            make.size.width.equalTo(50)
            make.size.height.equalTo(50)
        }
        
        menuButton.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
    }
    
    func toggle(sender: AnyObject!)
    {
        (sender as! LBHamburgerButton).switchState()
    }
    
    func numberOfButtons(menuButton: MenuButton) -> Int
    {
        return 2
    }
    
    func itemForIndex(index: Int) -> MenuItem
    {
        return MenuItem(image: UIImage(named: "german dream eko.jpg")!)
    }
    
    func menuButton(menuButton: MenuButton, didSelectItemAtIndex index: Int)
    {
        print(index)
    }
}