//
//  OneHomeProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

protocol OneHomeProtocol: NSObjectProtocol {

    func updateLikeNumber(senderTag: Int)
    
    func pullUpLoadMore()
}
