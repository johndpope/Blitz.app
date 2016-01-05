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
    var menuItems = [
        MenuItem(image: UIImage.listPinsImage(), highlightedImage: UIImage.listPinsImageHighlighted()),
        MenuItem(image: UIImage.addPinImage(), highlightedImage: UIImage.addPinImageHighlighted())
    ]

    override func viewDidLoad()
    {
        view.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 166/255, alpha: 1)
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
