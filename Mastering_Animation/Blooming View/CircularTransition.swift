//
//  CircularTransition.swift
//  Mastering_Animation
//
//  Created by 신의연 on 2020/08/05.
//  Copyright © 2020 Koggy. All rights reserved.
//

import UIKit

class CircularTransition: NSObject {
    var circle = UIView()
    var startingPoint: CGPoint = .zero {
        didSet {
            circle.center = startingPoint
        }
    }
    var circleColor = UIColor.white
    var duration = 0.3
    enum CircularTransitionMode {
        case present, dismiss, pop
    }
    var transitionMode: CircularTransitionMode = .present
}
extension CircularTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
            }
        } else {
            
        }
    }
    
    
    
}
