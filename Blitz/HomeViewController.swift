//
//  ViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 03/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, MenuButtonDataSource, MenuButtonDelegate
{
    let menuItems: Array<MenuItem> = [
        MenuItem(image: UIImage.listPinsImage(), highlightedImage: UIImage.listPinsImageHighlighted()),
        MenuItem(image: UIImage.addPinImage(), highlightedImage: UIImage.addPinImageHighlighted())
    ]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let mapView = MapView(frame: view.bounds)
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
        return menuItems.count
    }
    
    func itemForIndex(index: Int) -> MenuItem
    {
        return menuItems[index]
    }
    
    func menuButton(menuButton: MenuButton, didSelectItemAtIndex index: Int)
    {
        print(index)
    }
}