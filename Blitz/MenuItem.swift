//
//  MenuItem.swift
//  Blitz
//
//  Created by Umut Bozkurt on 04/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//

import UIKit

class MenuItem: UIButton
{
    static let width: CGFloat = 50
    static let height: CGFloat = 50
    static let margin: CGFloat = 10
    
    weak var parent: MenuButton?
    
    override func sendActionsForControlEvents(controlEvents: UIControlEvents)
    {
        super.sendActionsForControlEvents(controlEvents)
        
        if controlEvents == UIControlEvents.TouchUpInside
        {
            parent?.didTappedMenuItem(self)
        }
    }
    
    init(image: UIImage)
    {
        super.init(frame: CGRectZero)
        self.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 166/255, alpha: 1)
        self.imageView?.image = image
    }
    
    override var frame: CGRect
    {
        didSet
        {
            self.layer.cornerRadius = frame.size.width / 2
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
