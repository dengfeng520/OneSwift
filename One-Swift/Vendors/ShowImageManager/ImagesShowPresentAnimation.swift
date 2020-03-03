//
//  ImagesShowPresentAnimation.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ImagesShowPresentAnimation: NSObject {
  
}

extension ImagesShowPresentAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) 
        toVC!.view.frame = CGRect(x: 0, y: __screenHeight, width: __screenWidth, height: __screenHeight)
        let contaionView: UIView = transitionContext.containerView
        contaionView.addSubview(toVC!.view)
        toVC!.view.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        toVC!.view.alpha = 0
        toVC!.view.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.35, animations: {
            toVC!.view.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            toVC!.view.alpha = 1
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}
