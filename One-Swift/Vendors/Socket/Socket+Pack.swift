//
//  Socket+Pack.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

@available(iOS 10.0, *)
extension SocketClient {
    
    func packWithCmd(CMD : Unit , protobuf : Data) -> Data {
        let data : NSMutableData = NSMutableData.init();
        var dataLength : Int;
        if protobuf.isEmpty {
            dataLength = 0
        } else {
            dataLength = 4
        }
        data.append(&dataLength, length: 4)
        data.append(protobuf)
        return data as Data;
    }

  
}
