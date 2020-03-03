//
//  ReadModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/3.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ReadingBannerModel: NSObject {
    var id: String? = nil
    var title: String? = nil
    var cover: String? = nil
    var bottom_text: String? = nil
    var bgcolor: String? = nil
    var pv_url: String? = nil
}

extension ReadingBannerModel {
    func readJSONFromModel(json: Dictionary<String, Any>) -> [Any] {
        var bannerAry = Array<Any>()
        if json.keys.contains("data") {
            var dataAry: Array<AnyObject>? = nil
            dataAry = (json["data"] as! Array<AnyObject>)
            if (dataAry!.count != 0) {
                dataAry?.forEach({
                    item in
                    
                    let model: ReadingBannerModel = ReadingBannerModel()
                    model.id = item["id"] as? String
                    model.title = item["title"] as? String
                    model.cover = item["cover"] as? String
                    model.bottom_text = item["bottom_text"] as? String
                    model.bgcolor = item["bgcolor"] as? String
                    model.pv_url = item["pv_url"] as? String
                    
                  bannerAry.append(model)
                })
            }
        }
        return bannerAry.count != 0 ? bannerAry : []
    }
}
