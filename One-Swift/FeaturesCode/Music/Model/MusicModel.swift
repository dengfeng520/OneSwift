//
//  MusicModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusicModel: NSObject {

    
    func musicIdListJsonFronModel(json: Dictionary<String, Any>) -> Any? {
        if json.keys.contains("data") {
            let array: Array<Any> = json["data"] as! Array<Any>
            return array
        }
        return []
    }
}

