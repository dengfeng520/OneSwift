//
//  OnePageModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class OnePageModel: NSObject {

    var hpcontent_id: String? = nil
    var hp_title: String? = nil
    var author_id: String? = nil
    var hp_img_url: String? = nil
    var hp_img_original_url: String? = nil
    var hp_author: String? = nil
    var ipad_url: String? = nil
    var hp_content: String? = nil
    var hp_makettime: String? = nil
    var last_update_date: String? = nil
    var web_url: String? = nil
    var wb_img_url: String? = nil
    var image_authors: String? = nil
    var text_authors: String? = nil
    var image_from: String? = nil
    var text_from: String? = nil
    var content_bgcolor: String? = nil
    var template_category: String? = nil
    var maketime: String? = nil
    var share_list: Array<Any>? = nil
    var praisenum: Int? = nil
    var sharenum: String? = nil
    var commentnum: String? = nil
    var select: Bool = false
    override init() {
       
    }
    
    func jsonFromModel(json : Dictionary<String, Any>) -> [Any] {
        var homeAry = Array<Any>()
        if json.keys.contains("data") {
            var dataAry: Array<AnyObject>? = nil
            dataAry = (json["data"] as! Array<AnyObject>)
            if (dataAry!.count != 0) {
                dataAry?.forEach({
                    item in
                    let model: OnePageModel = OnePageModel()
                    model.hpcontent_id = item["hpcontent_id"] as? String
                    model.hp_title = item["hp_title"] as? String
                    model.author_id = item["author_id"] as? String
                    model.hp_img_url = item["hp_img_url"] as? String
                    model.hp_img_original_url = item["hp_img_original_url"] as? String
                    model.hp_author = item["hp_author"] as? String
                    model.ipad_url = item["ipad_url"] as? String
                    model.hp_content = item["hp_content"] as? String
                    model.hp_makettime = item["hp_makettime"] as? String
                    model.last_update_date = item["last_update_date"] as? String
                    model.web_url = item["web_url"] as? String
                    model.wb_img_url = item["wb_img_url"] as? String
                    model.image_authors = item["image_authors"] as? String
                    model.text_authors = item["text_authors"] as? String
                    model.image_from = item["image_from"] as? String
                    model.text_from = item["text_from"] as? String
                    model.content_bgcolor = item["content_bgcolor"] as? String
                    model.template_category = item["template_category"] as? String
                    model.maketime = item["maketime"] as? String
                    model.share_list = item["share_list"] as? Array
                    model.praisenum = item["praisenum"] as? Int
                    model.sharenum = item["sharenum"] as? String
                    model.commentnum = item["commentnum"] as? String
                    model.select = false
                    homeAry.append(model)
                })
            }
        }
        return homeAry
    }
   
}
