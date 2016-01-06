//
//  MenuButton.swift
//  Blitz
//
//  Created by Umut Bozkurt on 04/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit
import SnapKit
import pop

typealias MenuButtonType = LBHamburgerButtonType

protocol MenuButtonDataSource
{
    func numberOfButtons(menuButton: MenuButton) -> Int
    func itemForIndex(index: Int) -> MenuItem
}

protocol MenuButtonDelegate
{
    func menuButton(menuButton: MenuButton, didSelectItemAtIndex index: Int)
}

class MenuButton: LBHamburgerButton
{
    var delegate: MenuButtonDelegate?
    var dataSource: MenuButtonDataSource?
    
    init(type: MenuButtonType)
    {
        super.init(
            frame: CGRectMake(0, 0, 50, 50),
            type: type,
            lineWidth: 25,
            lineHeight: 3,
            lineSpacing: 5,
            lineCenter: CGPoint(x: 25, y: 25), color: UIColor.whiteColor()
        )
        
        hamburgerAnimationDuration = 0.25
        layer.cornerRadius = bounds.size.width / 2
        backgroundColor = UIColor.blitzDarkBlueColor()
    }

    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    func placeLowerRight(ofView view:UIView)
    {
        view.addSubview(self)
        
        self.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(view).offset(-15)
            make.size.width.equalTo(50)
            make.size.height.equalTo(50)
        }
    }
    
    override func switchState()
    {
        let items = getItems()
        
        for index in 0..<items.count
        {
            let item = items[index]
            item.parent = self
            
            let initialFrame = self.frame
            let targetFrame = CGRectMake(
                self.frame.origin.x,
                self.frame.origin.y - CGFloat(index + 1) * (MenuItem.height + MenuItem.margin),
                MenuItem.width,
                MenuItem.height
            )
            
            let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)

            if hamburgerState == LBHamburgerButtonState.Hamburger
            {
                animation.fromValue = NSValue(CGRect: initialFrame)
                animation.toValue = NSValue(CGRect: targetFrame)
                self.superview?.insertSubview(item, belowSubview: self)
            }
            else
            {
                animation.fromValue = NSValue(CGRect: targetFrame)
                animation.toValue = NSValue(CGRect: initialFrame)
                animation.completionBlock = {(anim, completed) in
                    item.removeFromSuperview()
                }
            }
            
            animation.springSpeed = CGFloat(30)
            animation.springBounciness = CGFloat(15)
            animation.dynamicsFriction = CGFloat(30)
            
            item.pop_removeAllAnimations()
            item.pop_addAnimation(animation, forKey: "spring")
        }
        super.switchState()
    }
    
    func getItems() -> Array<MenuItem>
    {
        let count = dataSource?.numberOfButtons(self) ?? 0
        var items: [MenuItem] = []
        
        for index in 0..<count
        {
            items.append((dataSource?.itemForIndex(index))!)
        }
        
        return items
    }
    
    func didTapMenuItem(menuItem: MenuItem)
    {
        let items = getItems()
        
        for index in 0..<items.count
        {
            if items[index] == menuItem
            {
                delegate?.menuButton(self, didSelectItemAtIndex: index)
                break
            }
        }
    }
}
