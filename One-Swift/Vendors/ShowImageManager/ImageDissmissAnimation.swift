//
//  ImageDissmissAnimation.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ImageDissmissAnimation: NSObject {

}

extension ImageDissmissAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        fromVC?.view.frame = CGRect(x: 0, y: 0, width: __screenWidth, height: __screenHeight)
        let containView = transitionContext.containerView
        containView.addSubview(fromVC!.view)
        fromVC?.view.transform = CGAffineTransform(scaleX: 1, y: 1)
        UIView.animate(withDuration: 0.35, animations: {
            fromVC?.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            fromVC?.view.alpha = 0
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
    }
}
