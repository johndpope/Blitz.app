//
//  ViewController.swift
//  Blitz
//
//  Created by Umut Bozkurt on 03/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, MenuButtonDelegate
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        menuItems = [
            MenuItem(image: UIImage.listPinsImage(), highlightedImage: UIImage.listPinsImageHighlighted()),
            MenuItem(image: UIImage.addPinImage(), highlightedImage: UIImage.addPinImageHighlighted())
        ]
        
        let mapView = MapView(frame: view.bounds)
        view.addSubview(mapView)
        
        menuButton = MenuButton(type: MenuButtonType.CloseButton)
        menuButton!.delegate = self
        menuButton!.dataSource = self
        menuButton!.placeLowerRight(ofView: view)
        menuButton!.addTarget(self, action: "toggle:", forControlEvents: .TouchUpInside)
    }
    
    func toggle(sender: AnyObject!)
    {
        (sender as! MenuButton).switchState()
    }

    func menuButton(menuButton: MenuButton, didSelectItemAtIndex index: Int)
    {
        let item = menuItems[index]
        
        CATransaction.begin()
        performSegueWithIdentifier("addBlitz", sender: item)
        CATransaction.setCompletionBlock { () -> Void in
            menuButton.switchState()
        }
        CATransaction.commit()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        transitionView = sender as? UIView
    }
}