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

class ViewController: UIViewController, MenuButtonDataSource, MenuButtonDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let mapView = MGLMapView(frame: view.bounds) // styleURL: NSURL(string: "mapbox://styles/umutbozkurt/ciiz9ym1y00pj2lkn4vkpvifd")
        mapView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        mapView.attributionButton.hidden = true
        
        // set the map's center coordinate
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: 40.7326808,
            longitude: -73.9843407),
            zoomLevel: 12, animated: false)
        view.addSubview(mapView)
        
        let menuButton = MenuButton(
            frame: CGRectMake(0, 0, 50, 50),
            type: LBHamburgerButtonType.CloseButton,
            lineWidth: 25, lineHeight: 3, lineSpacing: 5,
            lineCenter: CGPoint(x: 25, y: 25), color: UIColor.whiteColor()
        )
        
        menuButton.delegate = self
        menuButton.dataSource = self
        
        view.addSubview(menuButton)
        
        menuButton.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(view).offset(-15)
            make.size.width.equalTo(50)
            make.size.height.equalTo(50)
        }
        
        menuButton.hamburgerAnimationDuration = 0.35
        menuButton.layer.cornerRadius = menuButton.bounds.size.width / 2
        menuButton.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 166/255, alpha: 1)
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
    
    func menuButton(menuButton: MenuButton, didSelectItemAtIndex: Int)
    {
        print(didSelectItemAtIndex)
    }
}