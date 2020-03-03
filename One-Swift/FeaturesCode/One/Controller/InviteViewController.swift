//
//  InviteViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/13.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var rootViewHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var rulesOfRewardLab: UILabel!
    @IBOutlet weak var rulesRewardInfoLab: UILabel!
    @IBOutlet weak var inviteFriendsBtn: UIButton!
    @IBOutlet weak var IllustrationLab: UILabel!
    @IBOutlet weak var IllustrationInfoLab: UILabel!
    @IBOutlet weak var copyrightLab: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Invite";
        configUI();
    }
   
    func configUI()  {
        if (__screenWidth == 320) {
            self.rootViewHeight.constant = 560;
        } else {
            self.scrollView.contentSize = CGSize(width: 0,height: __screenHeight);
        }
        self.topView.layer.cornerRadius = 8;
        self.rulesOfRewardLab.font = UIFont.init(name: "Montserrat-Bold", size: 12);
        self.rulesRewardInfoLab.font = UIFont.init(name: "Montserrat-SemiBold", size: 12);
        self.IllustrationLab.font = UIFont.init(name: "Montserrat-Bold", size: 12);
        self.IllustrationInfoLab.font = UIFont.init(name: "Montserrat-SemiBold", size: 12);
        self.copyrightLab.font = UIFont.init(name: "Montserrat-Medium", size: 10); self.inviteFriendsBtn.layer.masksToBounds = true;
        self.inviteFriendsBtn.layer.cornerRadius = 22;
        self.inviteFriendsBtn.titleLabel?.font = UIFont.init(name: "Montserrat-Bold", size: 16);
    }
  
}
