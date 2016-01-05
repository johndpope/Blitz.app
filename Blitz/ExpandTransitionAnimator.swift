//
//  UIColor+Blitz.swift
//  Blitz
//
//  Created by Umut Bozkurt on 05/01/16.
//  Copyright © 2016 Umut Bozkurt. All rights reserved.
//
// http://www.raywenderlich.com/86521/how-to-make-a-view-controller-transition-animation-like-in-the-ping-app

import UIKit

class ExpandTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning
{
    weak var transitionContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval
    {
        return 0.3;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)
    {
        self.transitionContext = transitionContext
        
        let containerView = transitionContext.containerView()
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! BaseViewController
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! BaseViewController
        
        let button = fromViewController.transitionView!
        containerView!.addSubview(toViewController.view)
        
        let circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        let extremePoint = CGPointMake(0, 0)  // extreme is upper left corner in our case
        let radius = 2 * sqrt(abs(pow(extremePoint.x + button.frame.origin.x, 2) - pow(extremePoint.y + button.frame.origin.y, 2)))
        let circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool)
    {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
    
}
