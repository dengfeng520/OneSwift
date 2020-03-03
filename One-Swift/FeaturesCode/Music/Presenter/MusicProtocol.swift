//
//  MusicProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

@objc protocol MusicProtocol: NSObjectProtocol {
    
   @objc optional func convertJsonToModel(model: MusicDetailModel)

}

extension MusicProtocol {
    
}
