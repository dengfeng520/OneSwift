//
//  OneBaseTabBarViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class OneBaseTabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        let oneNavController = UINavigationController.init(rootViewController:OnePageViewController())
        let allNavController = UINavigationController.init(rootViewController:ReadingViewController())
        let meNavController = UINavigationController.init(rootViewController:MusicViewController())
        let topicNavController = UINavigationController.init(rootViewController:TopicMainViewController())

        self.viewControllers = [oneNavController,allNavController,meNavController,topicNavController]
        self.delegate = self as UITabBarControllerDelegate

        self.tabBarItem.imageInsets = UIEdgeInsets(top: 0,left: 0,bottom: -3,right: 0)
        var items : [UITabBarItem] = self.tabBar.items!
        items[0].image = UIImage.init(named: "tab_home_selected")
        items[1].image = UIImage.init(named: "tab_read_normal")
        items[2].image = UIImage.init(named: "tab_music_normal")
        items[3].image = UIImage.init(named: "tab_movie_normal")
        items[0].title = "One"
        items[1].title = "Read"
        items[2].title = "Music"
        items[3].title = "Topic"

        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    
        return true;
    }
    
    func hiddenTabBar(hidden : Bool) -> Void {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.35)
        for view in self.view.subviews {
            if view is UITabBar {
                if hidden {
                    var frame = view.frame
                    frame.origin.y = __screenHeight
                    view.frame = frame
                } else {
                    var frame = view.frame
                    frame.origin.y = __screenHeight - self.tabBar.frame.size.height
                    view.frame = frame
                }
            }
        }
        UIView.commitAnimations()
    }
}
