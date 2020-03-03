//
//  MusicDetailModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusicDetailModel: NSObject {

    var ID: String? = nil
    var title: String? = nil
    var cover: String? = nil
    var isfirst: String? = nil
    var story_title: String? = nil
    var story: String? = nil
    var lyric: String? = nil
    var info: String? = nil
    var platform: String? = nil
    var music_id: String? = nil
    var charge_edt: String? = nil
    var related_to: String? = nil
    var web_url: String? = nil
    var praisenum: String? = nil
    var hide_flag: String? = nil
    var sort: String? = nil
    var maketime: String? = nil
    var last_update_date: String? = nil
    var read_num: String? = nil
    var story_summary: String? = nil
    var audio: String? = nil
    var anchor: String? = nil
    var editor_email: String? = nil
    var related_musics: String? = nil
    var album: String? = nil
    var start_video: String? = nil
    var media_type: String? = nil
    var copyright: String? = nil
    var audio_duration: String? = nil
    var author: authorDataModel? = nil
    var story_author: storyAuthorModel? = nil
    var author_list: Array<authorArrayModel>? = nil
    var feeds_cover: String? = nil
    var next_id: String? = nil
    var previous_id: String? = nil
    var tag_list: Array<Any>? = nil
    var music_exception: String? = nil
    var sharenum: String? = nil
    var commentnum: String? = nil
    var share_list: sharaListModel? = nil
}


struct authorDataModel {
    var user_id: String? = nil
    var user_name: String? = nil
    var web_url: String? = nil
    var summary: String? = nil
    var desc: String? = nil
    var is_settled: String? = nil
    var settled_type: String? = nil
    var fans_total: String? = nil
    var wb_name: String? = nil
    
    func converAuthorToModel(data: Dictionary<String, Any>) -> authorDataModel {
    
        var model = authorDataModel()
        model.user_id = data["user_id"] as? String
        model.user_name = data["user_name"] as? String
        model.web_url = data["web_url"] as? String
        model.summary = data["summary"] as? String
        model.desc = data["desc"] as? String
        model.is_settled = data["is_settled"] as? String
        model.settled_type = data["settled_type"] as? String
        model.fans_total = data["fans_total"] as? String
        model.wb_name = data["wb_name"] as? String
        
        
        return model
    }
}

struct storyAuthorModel {
    var user_id: String? = nil
    var user_name: String? = nil
    var desc: String? = nil
    var wb_name: String? = nil
    var is_settled: String? = nil
    var settled_type: String? = nil
    var summary: String? = nil
    var fans_total: String? = nil
    var web_url: String? = nil
    
    func converStoryAuthorToModel(data: Dictionary<String, Any>) -> storyAuthorModel {
        
        var model = storyAuthorModel()
        model.user_id = data["user_id"] as? String
        model.user_name = data["user_name"] as? String
        model.web_url = data["web_url"] as? String
        model.summary = data["summary"] as? String
        model.desc = data["desc"] as? String
        model.is_settled = data["is_settled"] as? String
        model.settled_type = data["settled_type"] as? String
        model.fans_total = data["fans_total"] as? String
        model.wb_name = data["wb_name"] as? String
        
        
        return model
    }
}

struct authorArrayModel {
    var user_id: String? = nil
    var user_name: String? = nil
    var desc: String? = nil
    var wb_name: String? = nil
    var is_settled: String? = nil
    var settled_type: String? = nil
    var summary: String? = nil
    var fans_total: String? = nil
    var web_url: String? = nil
    
    
    func converAuthorArrayToModel(data: Dictionary<String, Any>) -> authorArrayModel {
        
        var model = authorArrayModel()
        model.user_id = data["user_id"] as? String
        model.user_name = data["user_name"] as? String
        model.web_url = data["web_url"] as? String
        model.summary = data["summary"] as? String
        model.desc = data["desc"] as? String
        model.is_settled = data["is_settled"] as? String
        model.settled_type = data["settled_type"] as? String
        model.fans_total = data["fans_total"] as? String
        model.wb_name = data["wb_name"] as? String
        
        
        return model
    }
}

struct sharaListModel {
    var wx: sharamodel? = nil
    var wx_timeline: sharamodel? = nil
    var weibo: sharamodel? = nil
    var qq: sharamodel? = nil
}

struct sharamodel {
    var title: String? = nil
    var desc: String? = nil
    var link: String? = nil
    var imgUrl: String? = nil
    var audio: String? = nil
}

extension MusicDetailModel {
    func convertDetailsJsonToModel(json: Dictionary<String, Any>) -> Any {
        
        let model: MusicDetailModel = MusicDetailModel()
        if json.keys.contains("data") {
            let dataDic = json["data"] as! Dictionary<String, Any>
            model.ID = dataDic["id"] as? String
            model.title = dataDic["title"] as? String
            model.cover = dataDic["cover"] as? String
            model.isfirst = dataDic["isfirst"] as? String
            model.story_title = dataDic["story_title"] as? String
            model.story = dataDic["story"] as? String
            model.lyric = dataDic["lyric"] as? String
            model.info = dataDic["info"] as? String
            model.platform = dataDic["platform"] as? String
            model.music_id = dataDic["music_id"] as? String
            model.charge_edt = dataDic["charge_edt"] as? String
            model.related_to = dataDic["related_to"] as? String
            model.web_url = dataDic["web_url"] as? String
            model.praisenum = dataDic["praisenum"] as? String
            model.hide_flag = dataDic["hide_flag"] as? String
            model.sort = dataDic["sort"] as? String
            model.maketime = dataDic["maketime"] as? String
            model.last_update_date = dataDic["last_update_date"] as? String
            model.read_num = dataDic["read_num"] as? String
            model.story_summary = dataDic["story_summary"] as? String
            model.audio = dataDic["audio"] as? String
            model.anchor = dataDic["anchor"] as? String
            model.editor_email = dataDic["editor_email"] as? String
            model.related_musics = dataDic["related_musics"] as? String
            model.album = dataDic["album"] as? String
            model.start_video = dataDic["start_video"] as? String
            model.media_type = dataDic["media_type"] as? String
            model.copyright = dataDic["copyright"] as? String
            model.audio_duration = dataDic["audio_duration"] as? String
            
            
            let authorDic = dataDic["author"] as? Dictionary<String, Any>
            model.author = authorDataModel().converAuthorToModel(data: authorDic!)
            
            let storyDic = dataDic["story_author"] as? Dictionary<String, Any>
            model.story_author = storyAuthorModel().converStoryAuthorToModel(data: storyDic!)
            
            
            let authorAry: Array<Any> = dataDic["author_list"] as! Array<Any>
            var authList = Array<Any>.init()
            for authorData in authorAry {
                let listModel = authorArrayModel().converAuthorArrayToModel(data: authorData as! Dictionary<String, Any>)
                authList.append(listModel)
            }
            model.author_list = (authList as! Array<authorArrayModel>)
            
            
            model.feeds_cover = dataDic["feeds_cover"] as? String
            model.next_id = dataDic["next_id"] as? String
            model.previous_id = dataDic["previous_id"] as? String
            
            model.tag_list = dataDic["tag_list"] as? [Any]
            model.music_exception = dataDic["music_exception"] as? String
            model.sharenum = dataDic["sharenum"] as? String
            model.commentnum = dataDic["commentnum"] as? String
            
            
        }
        
        return model
    }
}
