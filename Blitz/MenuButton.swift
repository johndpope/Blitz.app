//
//  MenuButton.swift
//  Blitz
//
//  Created by Umut Bozkurt on 04/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit

protocol MenuButtonDataSource
{
    func numberOfButtons(menuButton: MenuButton) -> Int
    func itemForIndex(index: Int) -> MenuItem
}

protocol MenuButtonDelegate
{
    func menuButton(menuButton: MenuButton, didSelectItemAtIndex: Int)
}

class MenuButton: LBHamburgerButton
{
    var delegate: MenuButtonDelegate?
    var dataSource: MenuButtonDataSource?
    var items: [MenuItem] = []
    
    override func switchState()
    {
        for var index = 0; index < getItems().count; ++index
        {
            let item = getItems()[index]
            
            if hamburgerState == LBHamburgerButtonState.Hamburger
            {
                item.frame = CGRectMake(
                    self.frame.origin.x,
                    self.frame.origin.y - CGFloat(index + 1) * (MenuItem.height + MenuItem.margin),
                    MenuItem.width,
                    MenuItem.height
                )
                
                item.layer.cornerRadius = self.bounds.width / 2
                self.superview?.addSubview(item)
            }
            else
            {
                item.removeFromSuperview()
            }
        }
        super.switchState()
    }
    
    func getItems() -> Array<MenuItem>
    {
        if items.isEmpty
        {
            let count = dataSource?.numberOfButtons(self) ?? 0
            
            for index in 1...count
            {
                items.append((dataSource?.itemForIndex(index))!)
            }
        }
        
        return items
    }
    
    func didTappedMenuItem(menuItem: MenuItem)
    {
        let count = dataSource?.numberOfButtons(self) ?? 0
        
        for index in 0...count
        {
            if dataSource?.itemForIndex(index) == menuItem
            {
                delegate?.menuButton(self, didSelectItemAtIndex: index)
                break
            }
        }
    }
}
