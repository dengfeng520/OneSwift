//
//  UniverseMainTableViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/7/2.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class UniverseMainPlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var placeFristView: UIView!
    @IBOutlet weak var placeSecondView: UIView!
    @IBOutlet weak var placeThridView: UIView!
    @IBOutlet weak var placeFourView: UIView!
    @IBOutlet weak var placeFifthView: UIView!
    @IBOutlet weak var placeSixView: UIView!
    @IBOutlet weak var placeSeventhView: UIView!
    @IBOutlet weak var placeEighthView: UIView!
    @IBOutlet weak var placeNinthView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
        self.placeFristView.layer.cornerRadius = 16
        self.placeSecondView.layer.cornerRadius = 7
        self.placeThridView.layer.cornerRadius = 7
        self.placeFourView.layer.cornerRadius = 7
        self.placeFifthView.layer.cornerRadius = 7
        self.placeSixView.layer.cornerRadius = 7
        self.placeSeventhView.layer.cornerRadius = 8
        self.placeEighthView.layer.cornerRadius = 8
        self.placeNinthView.layer.cornerRadius = 8
        
        
        addAlpahAnimation(isView: self.placeFristView)
        addAlpahAnimation(isView: self.placeSecondView)
        addAlpahAnimation(isView: self.placeThridView)
        addAlpahAnimation(isView: self.placeFourView)
        addAlpahAnimation(isView: self.placeFifthView)
        addAlpahAnimation(isView: self.placeSixView)
        addAlpahAnimation(isView: self.placeSeventhView)
        addAlpahAnimation(isView: self.placeEighthView)
        addAlpahAnimation(isView: self.placeNinthView)
    }
    
    func addAlpahAnimation(isView: UIView) {
        // 透明度
        let animationAlpah = CABasicAnimation.init(keyPath: "opacity")
        animationAlpah.fromValue = 1
        animationAlpah.toValue = 0.35
        animationAlpah.autoreverses = true
        animationAlpah.duration = 0.7
        animationAlpah.repeatCount = .greatestFiniteMagnitude
        animationAlpah.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        animationAlpah.isRemovedOnCompletion = false
        
        isView.layer.add(animationAlpah, forKey: "groupAnimation")
    }
    
    func addGroupAnimation(isView: UIView) {
        
        let group = CAAnimationGroup.init()
        
        // 缩放
        let animationSize = CABasicAnimation.init(keyPath: "transform.scale")
        animationSize.fromValue = 1
        animationSize.toValue = 1.05

        // 透明度
        let animationAlpah = CABasicAnimation.init(keyPath: "opacity")
        animationAlpah.fromValue = 1
        animationAlpah.toValue = 0.5

        // 组合
        group.animations = [animationSize,animationAlpah]
        group.autoreverses = true
        group.duration = 0.7
        group.repeatCount = .greatestFiniteMagnitude
        group.timingFunction = CAMediaTimingFunction.init(name: .easeIn)
        group.isRemovedOnCompletion = false
        
        isView.layer.add(group, forKey: "groupAnimation")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
