//
//  TopicModel.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class TopicModel: NSObject {
 
    var nickname : String? = nil
    var iso_code : String? = nil
    var ID : String? = nil
    var uid : String? = nil
    var topic : String? = nil
    var content : String? = nil
    var images : Array<String>? = nil
    var avatar : String? = nil
    var like : String? = nil
    
    func getModelDataFromServerHashMap(json : Dictionary<String, Any>) {
        if (json.keys.contains("nickname")) {
            self.nickname = json["nickname"] as? String;
        }
        if (json.keys.contains("iso_code")) {
            self.iso_code = json["iso_code"] as? String;
        }
        if (json.keys.contains("id")) {
            self.ID = json["id"] as? String;
        }
        if (json.keys.contains("uid")) {
            self.uid = json["uid"] as? String;
        }
        if (json.keys.contains("content")) {
            self.content = json["content"] as? String;
        }
        if (json.keys.contains("topic")) {
            self.topic = json["topic"] as? String;
        }
        if (json.keys.contains("images")) {
            self.images = json["images"] as? Array;
        }
        if (json.keys.contains("avatar")) {
            self.avatar = json["avatar"] as? String;
        }
        if (json.keys.contains("like")) {
            self.like = json["like"] as? String;
        }
    }
}
