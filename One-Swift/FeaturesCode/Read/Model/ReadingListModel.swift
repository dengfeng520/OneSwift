//
//  ReadingListModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/3.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation


class ReadingListModel: NSObject {
   
}

struct essayModel {
    var content_id: String? = nil
    var hp_title: String? = nil
    var hp_makettime: String? = nil
    var guide_word: String? = nil
    var start_video: String? = nil
    var author: [Any]? = nil
    var has_audio: Bool = false
    var author_list: [Any]? = nil
}

struct serialModel {
    var ID: Int? = nil
    var serial_id: Int? = nil
    var number: Int? = nil
    var title: String? = nil
    var excerpt: String? = nil
    var read_num: Int? = nil
    var maketime: String? = nil
    var start_video: String? = nil
    var author: authorModel? = nil
    var has_audio: Bool = false
    var author_list: [Any]? = nil
    var serial_list: [Any]? = nil
}

struct questionModel {
    var question_id: Int? = nil
    var question_title: String? = nil
    var answer_title: String? = nil
    var answer_content: String? = nil
    var question_makettime: String? = nil
    var start_video: String? = nil
    var author_list: [authorModel]? = nil
    var asker_list: [Any]? = nil
}

struct authorModel {
    var user_id: Int? = nil
    var user_name: String? = nil
    var desc: Int? = nil
    var wb_name: String? = nil
    var is_settled: Bool? = nil
    var settled_type: String? = nil
    var summary: Int? = nil
    var fans_total: String? = nil
    var web_url: String? = nil
}

struct authorListModel {
    var user_id: Int? = nil
    var user_name: String? = nil
    var desc: String? = nil
    var wb_name: String? = nil
    var is_settled: Bool? = nil
    var settled_type: String? = nil
    var summary: String? = nil
    var fans_total: Int? = nil
    var web_url: String? = nil
    
}

extension ReadingListModel {
    func readingListJSONFromModel(json: Dictionary<String, Any>) -> Array<Any> {
        var allArray: [Any] = Array<Any>()

        if json.keys.contains("data") {
            let data: Dictionary<String, Any> = json["data"] as! Dictionary<String, Any>
            
            if data.keys.contains("essay") {
                let assayList: Array<AnyObject> = data["essay"] as! Array<AnyObject>
                let assayAry = convertEssayToModel(data: assayList)
                allArray.append(assayAry)
            }
            
            if data.keys.contains("serial") {
                let serialList: Array<AnyObject> = data["serial"] as! Array<AnyObject>
                let serialAry = convertSerialToModel(data: serialList)
                allArray.append(serialAry)
            }
            
            if data.keys.contains("question") {
                let questionlList: Array<AnyObject> = data["question"] as! Array<AnyObject>
                let questionAry = convertQuestionToModel(data: questionlList)
                allArray.append(questionAry)
            }
        }
        
        return allArray
    }
}

extension ReadingListModel {
    func convertEssayToModel(data: Array<AnyObject>) -> Array<essayModel> {
        var assayAry: Array<Any> = Array<Any>()
        
        data.forEach({ (obj) in
            var model: essayModel = essayModel()
            model.content_id = obj["content_id"] as? String
            model.hp_title = obj["hp_title"] as? String
            model.hp_makettime = obj["hp_makettime"] as? String
            model.guide_word = obj["guide_word"] as? String
            model.start_video = obj["start_video"] as? String
            model.has_audio = obj["has_audio"] as! Bool
            
            
            let author = obj["author"] as! Array<AnyObject>
            var authorAry: Array<Any> = Array<Any>()
            author.forEach({ (authorDic) in
                var autoModel: authorModel = authorModel()
                autoModel.user_id = authorDic["user_id"] as? Int
                autoModel.user_name = authorDic["user_name"] as? String
                autoModel.desc = authorDic["desc"] as? Int
                autoModel.wb_name = (authorDic["wb_name"] as! String)
                autoModel.is_settled = authorDic["is_settled"] as? Bool
                autoModel.settled_type = authorDic["settled_type"] as? String
                autoModel.summary = authorDic["summary"] as? Int
                autoModel.fans_total = authorDic["fans_total"] as? String
                autoModel.web_url = authorDic["web_url"] as? String
                
                authorAry.append(autoModel)
            })
            model.author = authorAry
            
            
            
            let author_list = obj["author_list"] as! Array<AnyObject>
            var authorListAry : [Any] = Array<Any>()
            author_list.forEach({ (authorListDic) in
                var listModel: authorListModel = authorListModel()
                listModel.user_id = authorListDic["user_id"] as? Int
                listModel.user_name = authorListDic["user_name"] as? String
                listModel.desc = authorListDic["desc"] as? String
                listModel.wb_name = (authorListDic["wb_name"] as! String)
                listModel.is_settled = authorListDic["is_settled"] as? Bool
                listModel.settled_type = authorListDic["settled_type"] as? String
                listModel.summary = authorListDic["summary"] as? String
                listModel.fans_total = authorListDic["fans_total"] as? Int
                listModel.web_url = authorListDic["web_url"] as? String
                
                authorListAry.append(listModel)
            })
            model.author_list = authorListAry
            
            
            assayAry.append(model)
        })
        return assayAry as! Array<essayModel>
    }
}



extension ReadingListModel {
    func convertSerialToModel(data: Array<AnyObject>) -> Array<serialModel> {
        if data.count == 0 {
            return []
        }
        var serialAry: Array<Any> = Array<Any>()
        data.forEach({ (obj) in
            
            var serModel: serialModel = serialModel()
            serModel.ID = obj["id"] as? Int
            serModel.serial_id = obj["serial_id"] as? Int
            serModel.number = obj["number"] as? Int
            serModel.title = obj["title"] as? String
            serModel.excerpt = obj["excerpt"] as? String
            serModel.read_num = obj["read_num"] as? Int
            serModel.maketime = obj["maketime"] as? String
            serModel.start_video = obj["start_video"] as? String
            serModel.has_audio = (obj["has_audio"] as? Bool)!
            
            
            let authorDic = obj["author"] as! Dictionary<String, Any>
            var autoModel: authorModel = authorModel()
            autoModel.user_id = authorDic["user_id"] as? Int
            autoModel.user_name = authorDic["user_name"] as? String
            autoModel.desc = authorDic["desc"] as? Int
            autoModel.wb_name = (authorDic["wb_name"] as! String)
            autoModel.is_settled = authorDic["is_settled"] as? Bool
            autoModel.settled_type = authorDic["settled_type"] as? String
            autoModel.summary = authorDic["summary"] as? Int
            autoModel.fans_total = authorDic["fans_total"] as? String
            autoModel.web_url = authorDic["web_url"] as? String
            serModel.author = autoModel
            
            
            
            let author_list = obj["author_list"] as! Array<AnyObject>
            var authorListAry : [Any] = Array<Any>()
            author_list.forEach({ (authorListDic) in
                var listModel: authorListModel = authorListModel()
                listModel.user_id = authorListDic["user_id"] as? Int
                listModel.user_name = authorListDic["user_name"] as? String
                listModel.desc = authorListDic["desc"] as? String
                listModel.wb_name = (authorListDic["wb_name"] as! String)
                listModel.is_settled = authorListDic["is_settled"] as? Bool
                listModel.settled_type = authorListDic["settled_type"] as? String
                listModel.summary = authorListDic["summary"] as? String
                listModel.fans_total = authorListDic["fans_total"] as? Int
                listModel.web_url = authorListDic["web_url"] as? String
                
                authorListAry.append(listModel)
            })
            serModel.author_list = authorListAry
            
            
            let serialListAry = obj["serial_list"] as! [Any]
            serModel.serial_list = serialListAry;
            
            serialAry.append(serModel)
        })
    
        
        return serialAry as! Array<serialModel>
    }
}

extension ReadingListModel {
    func convertQuestionToModel(data: Array<AnyObject>) -> Array<questionModel> {
        var questionAry: Array<Any> = Array<Any>()
        data.forEach { (obj) in
            var queModel: questionModel = questionModel()
            queModel.question_id = obj["question_id"] as? Int
            queModel.question_title = obj["question_title"] as? String
            queModel.answer_title = obj["answer_title"] as? String
            queModel.answer_content = obj["answer_content"] as? String
            queModel.question_makettime = obj["question_makettime"] as? String
            queModel.start_video = obj["start_video"] as? String
            
            
            let author = obj["asker_list"] as! Array<AnyObject>
            var authorAry: Array<Any> = Array<Any>()
            author.forEach({ (authorDic) in
                var autoModel: authorModel = authorModel()
                autoModel.user_id = authorDic["user_id"] as? Int
                autoModel.user_name = authorDic["user_name"] as? String
                autoModel.desc = authorDic["desc"] as? Int
                autoModel.wb_name = (authorDic["wb_name"] as! String)
                autoModel.is_settled = authorDic["is_settled"] as? Bool
                autoModel.settled_type = authorDic["settled_type"] as? String
                autoModel.summary = authorDic["summary"] as? Int
                autoModel.fans_total = authorDic["fans_total"] as? String
                autoModel.web_url = authorDic["web_url"] as? String
                
                authorAry.append(autoModel)
            })
            queModel.author_list = authorAry as? [authorModel]
            
            
            let asker_list = obj["asker_list"] as! Array<AnyObject>
            queModel.asker_list = asker_list
            
            
            questionAry.append(queModel)
        }
        
        return questionAry as! Array<questionModel>
    }
}


