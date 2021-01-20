//
//  SocketProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

protocol SocketProtocol: NSObjectProtocol {
    func socketLoginSuccess(code : Int)
}

extension SocketProtocol {
    /// 可选方法
    func socketLoginSuccess(code : Int)
}
