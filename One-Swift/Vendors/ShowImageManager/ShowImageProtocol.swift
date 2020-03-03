//
//  ShowImageProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

// TODO: - 后期预留
@objc protocol ShowImageProtocol: NSObjectProtocol {
    
   @objc optional func touchCurrentImageWithIndex(index: Int)
   @objc optional func deleteCurrentImageWithIndex(index: Int)
   @objc optional func saveCurrentImageWithIndex(index: Int)
}
