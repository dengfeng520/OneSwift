//
//  TopicProtocol.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

@objc protocol topicDelegate : NSObjectProtocol {
    
    @objc optional func updateCellUI()
    
    @objc optional static var someTypeProperty: Int { get set }
    
    
}
