//
//  LaunchScreenViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/22.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {

    var backgroundAnimationView: AnimationView? = nil
    var exploreEffectView: AnimationView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configBackgroundView()
        configexploreEffectView()
    }
    
    func configBackgroundView() {
        let path : String = Bundle.main.path(forResource: "Explore_Background", ofType: "json")!;
        self.backgroundAnimationView = AnimationView.init(filePath: path)
        self.view.addSubview(self.backgroundAnimationView!)
        self.backgroundAnimationView?.loopMode = LottieLoopMode.loop
        self.backgroundAnimationView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.backgroundAnimationView?.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundAnimationView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.backgroundAnimationView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.backgroundAnimationView?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.backgroundAnimationView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.backgroundAnimationView?.play()
    }
    
    func configexploreEffectView() {
        let path : String = Bundle.main.path(forResource: "Explore_Planet", ofType: "json")!;
        self.exploreEffectView = AnimationView.init(filePath: path)
        self.view.addSubview(self.exploreEffectView!)
        self.exploreEffectView?.loopMode = LottieLoopMode.loop
        self.exploreEffectView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.exploreEffectView?.translatesAutoresizingMaskIntoConstraints = false
        self.exploreEffectView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.exploreEffectView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.exploreEffectView?.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.exploreEffectView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.exploreEffectView?.play(fromFrame: 0, toFrame: 120, loopMode: LottieLoopMode.loop, completion: {
            (stop) in
            
        })
    }
}
