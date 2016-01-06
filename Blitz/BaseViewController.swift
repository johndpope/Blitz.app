//
//  BaseViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 05/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, MenuButtonDataSource
{
    var transitionView: UIView?    
    var menuItems: Array<MenuItem> = []

    override func viewDidLoad()
    {
        view.backgroundColor = UIColor.blitzDarkBlueColor()
    }
    
    func numberOfButtons(menuButton: MenuButton) -> Int
    {
        return menuItems.count
    }
    
    func itemForIndex(index: Int) -> MenuItem
    {
        return menuItems[index]
    }
}
