//
//  TopicViewModel.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/16.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class TopicViewModel: NSObject {

    func getAryListData() -> Array<Any> {
        let json : Dictionary<String, Any> = (reloadJsonFileData(fileName: "Topic", type: "json") as! NSDictionary) as! Dictionary<String, Any>;
        if (json.keys.contains("data")) {
            let lsMap : Dictionary<String,Any> = json["data"] as! Dictionary
            let lsList : Array<Any> = lsMap["list"] as! Array
            var dataList  = Array<Any>()
            for obj in lsList {
                let model : TopicModel = TopicModel();
                model.getModelDataFromServerHashMap(json: obj as! Dictionary<String, Any>);
                dataList.append(model)
            }
            return dataList;
        }
        return [];
    }
    
    func reloadJsonFileData(fileName : String ,type : String) -> Any? {
        let path : String = Bundle.main.path(forResource: fileName, ofType: type)!;
        let url : URL = URL(fileURLWithPath: path);
        do {
            let data : Data = try Data(contentsOf: url);
            let jsonData : NSDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
            return jsonData;
        } catch let error as Error? {
            return error?.localizedDescription;
        }
    }
}
