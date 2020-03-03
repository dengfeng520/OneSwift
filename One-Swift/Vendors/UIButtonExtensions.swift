//
//  UIButtonExtensions.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/20.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation
import UIKit

private var UIButton_badgeKey : Void?
private var UIButton_badgeBGColorKey : Void?
private var UIButton_badgeTextColorKey : Void?
private var UIButton_badgeFontKey : Void?
private var UIButton_badgePaddingKey : Void?
private var UIButton_badgeMinSizeKey : Void?
private var UIButton_badgeOriginXKey : Void?
private var UIButton_badgeOriginYKey : Void?
private var UIButton_shouldHideBadgeAtZeroKey : Void?
private var UIButton_shouldAnimateBadgeKey : Void?
private var UIButton_badgeValueKey : Void?

extension UIButton {
    fileprivate var badgeLabel: UILabel? {
        get {
            return  objc_getAssociatedObject(self, &UIButton_badgeKey) as? UILabel
        }
        set {
            objc_setAssociatedObject(self, &UIButton_badgeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var badgeValue : String?  {
        get {
            return objc_getAssociatedObject(self, &UIButton_badgeValueKey) as? String
        }
        
        set (badgeValue){
            objc_setAssociatedObject(self, &UIButton_badgeValueKey, badgeValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if (badgeValue?.isEmpty)!   || (badgeValue == "") || ((badgeValue == "0") && shouldHideBadgeAtZero) {
                removeBadge()
            } else if (self.badgeLabel == nil ) {
                
                self.badgeLabel  = UILabel(frame: CGRect(x: self.badgeOriginX , y: self.badgeOriginY, width: 20, height: 20))
                self.badgeLabel?.textColor = self.badgeTextColor
                self.badgeLabel?.backgroundColor = self.badgeBGColor
                self.badgeLabel?.font = self.badgeFont
                self.badgeLabel?.textAlignment = .center
                badgeInit()
                addSubview(self.badgeLabel!)
                updateBadgeValue(animated: false)
            } else {
                updateBadgeValue(animated: true)
            }
        }
    }
    
    var badgeBGColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &UIButton_badgeBGColorKey) as? UIColor ?? .red
        }
        set {
            objc_setAssociatedObject(self, &UIButton_badgeBGColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { refreshBadge() }
        }
    }
    
    var badgeTextColor: UIColor? {
        get{
            return objc_getAssociatedObject(self, &UIButton_badgeTextColorKey) as? UIColor ?? .white
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgeTextColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) {  refreshBadge() }
        }
    }

    var badgeFont: UIFont? {
        get {
            return objc_getAssociatedObject(self, &UIButton_badgeFontKey) as? UIFont ?? UIFont.systemFont(ofSize: 12)
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgeFontKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { refreshBadge() }
        }
    }
    
    var badgePadding: CGFloat {
        get{
            return  objc_getAssociatedObject(self, &UIButton_badgePaddingKey) as? CGFloat ?? 6
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgePaddingKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { updateBadgeFrame() }
        }
    }
    
    var badgeMinSize: CGFloat {
        get{
            return objc_getAssociatedObject(self, &UIButton_badgeMinSizeKey) as? CGFloat ?? 8
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgeMinSizeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { updateBadgeFrame() }
        }
    }
    
    var badgeOriginX: CGFloat {
        get{
            return objc_getAssociatedObject(self, &UIButton_badgeOriginXKey) as? CGFloat ?? 0
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgeOriginXKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { updateBadgeFrame() }
        }
    }
    
    var badgeOriginY: CGFloat  {
        get{
            return objc_getAssociatedObject(self, &UIButton_badgeOriginYKey) as? CGFloat ?? -4
        }
        set{
            objc_setAssociatedObject(self, &UIButton_badgeOriginYKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if (self.badgeLabel != nil) { updateBadgeFrame() }
        }
    }
    
    var shouldHideBadgeAtZero: Bool  {
        get {
            return objc_getAssociatedObject(self, &UIButton_shouldHideBadgeAtZeroKey) as? Bool ?? true
        }
        set {
            objc_setAssociatedObject(self, &UIButton_shouldHideBadgeAtZeroKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var shouldAnimateBadge: Bool {
        get{
            return objc_getAssociatedObject(self, &UIButton_shouldAnimateBadgeKey) as? Bool ?? true
        }
        set{
            objc_setAssociatedObject(self, &UIButton_shouldAnimateBadgeKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    fileprivate func badgeInit()  {
        if self.badgeLabel != nil {
            self.badgeOriginX = self.frame.size.width - 1
        }
        
        self.clipsToBounds = false
    }
    
    fileprivate func refreshBadge() {
        guard let tempLabel = self.badgeLabel else { return }
        tempLabel.textColor = self.badgeTextColor
        tempLabel.backgroundColor  = self.badgeBGColor
        tempLabel.font  = self.badgeFont
    }
    
    fileprivate func removeBadge() {
        UIView.animate(withDuration: 0.2, animations: {
            self.badgeLabel?.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        }) { (finished: Bool) in
            self.badgeLabel?.removeFromSuperview()
            if (self.badgeLabel != nil) { self.badgeLabel = nil }
        }
    }
    
    fileprivate func updateBadgeValue(animated: Bool) {
        if animated && self.shouldAnimateBadge && !(self.badgeLabel?.text == self.badgeValue) {
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1.5
            animation.toValue = 1
            animation.duration = 0.2
            animation.timingFunction = CAMediaTimingFunction(controlPoints: 0.4, 1.3, 1.0, 1.0)
            self.badgeLabel?.layer.add(animation, forKey: "bounceAnimation")
        }
        
        var badgeValue = 0
        if let badgeStr = self.badgeValue , let value = Int(badgeStr) {
            badgeValue = value
        }
        self.badgeLabel?.text = badgeValue >= 99 ? "99+" : self.badgeValue
        self.badgeLabel?.text =  self.badgeValue
        let duration: TimeInterval = (animated && self.shouldAnimateBadge) ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.updateBadgeFrame()
        })
    }
    
    fileprivate  func updateBadgeFrame() {
        let expectedLabelSize: CGSize = badgeExpectedSize()
        var minHeight: CGFloat = expectedLabelSize.height
        minHeight = (minHeight < badgeMinSize) ? badgeMinSize : expectedLabelSize.height
        var minWidth: CGFloat = expectedLabelSize.width
        let padding = self.badgePadding
        minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width
        self.badgeLabel?.frame = CGRect(x: self.badgeOriginX, y: self.badgeOriginY, width: minWidth + padding, height: minHeight + padding)
        self.badgeLabel?.layer.cornerRadius = (minHeight + padding) / 2
        self.badgeLabel?.layer.masksToBounds = true
    }
    
    fileprivate func badgeExpectedSize() -> CGSize {
        let frameLabel: UILabel = duplicate(self.badgeLabel)
        frameLabel.sizeToFit()
        let expectedLabelSize: CGSize = frameLabel.frame.size
        return expectedLabelSize
    }
    
    fileprivate func duplicate(_ labelToCopy: UILabel? ) -> UILabel {
        guard let temp = labelToCopy else { fatalError("xxxx") }
        let duplicateLabel = UILabel(frame: temp.frame )
        duplicateLabel.text = temp.text
        duplicateLabel.font = temp.font
        return duplicateLabel
    }

}
