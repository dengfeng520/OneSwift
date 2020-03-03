//
//  ImageShowPresentationController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ImageShowPresentationController: UIPresentationController {

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
    }

}
