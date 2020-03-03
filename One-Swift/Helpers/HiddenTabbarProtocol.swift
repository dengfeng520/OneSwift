//
//  HiddenTabbarProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/23.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

protocol HiddenTabbarProtocol: UIViewController {
   
}

extension HiddenTabbarProtocol {
    func isHiddenTabbar() {
        let rootVC = UIApplication.shared.delegate as! AppDelegate;
        let tabbarVC : OneBaseTabBarViewController = rootVC.window?.rootViewController as! OneBaseTabBarViewController;
        let views : NSArray = self.navigationController!.viewControllers as NSArray;
        if views.count > 1  {
            tabbarVC.hiddenTabBar(hidden: true);
        } else {
            tabbarVC.hiddenTabBar(hidden: false);
        }
    }
}
