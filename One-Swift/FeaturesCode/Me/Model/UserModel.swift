//
//  LoginModel.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/25.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
//import RealmSwift
//
//class UserModel: Object {
//    var userId: Int? = nil
//    var nickName: String? = nil
//    var avatarId: Int? = nil
//    var avatar: String? = nil
//    var email: String? = nil
//    var phone: String? = nil
//    var gold: Int? = nil
//    var FP: Float? = nil
//    var verify: String? = nil
//    var isoCode: String? = nil
//    var sex: Int? = nil
//    var birthday: Float? = nil
//    var astrology: String? = nil
//    var apiToken: String? = nil
//    var tags: Array<String>? = nil
//}
//
//extension UserModel {
//
//    func userJSONToModel(json: Dictionary<String, Any>) -> UserModel? {
//        if json.keys.contains("data") {
//            let dataDic = json["data"] as! Dictionary<String, Any>
//            if dataDic.keys.contains("user") {
//                let hashMap: Dictionary<String, Any> = dataDic["user"] as! Dictionary<String, Any>
//                let keychain = KeyChainHelper.init()
//                let save: Bool = keychain.saveDataFromKeyChain(data: hashMap, withIdentifier: __userKeyChain)
//                print("save===================\(save)")
//                let model: UserModel = UserModel()
//                model.userId = hashMap["uid"] as? Int
//                model.nickName = hashMap["nickname"] as? String
//                model.avatarId = hashMap["avatar_id"] as? Int
//                model.avatar = hashMap["avatar"] as? String
//                model.email = hashMap["email"] as? String
//                model.phone = hashMap["phone"] as? String
//                model.gold = hashMap["gold"] as? Int
//                model.FP = hashMap["FP"] as? Float
//                model.verify = hashMap["verify"] as? String
//                model.isoCode = hashMap["iso_code"] as? String
//                model.sex = hashMap["sex"] as? Int
//                model.birthday = hashMap["birthday"] as? Float
//                model.astrology = hashMap["astrology"] as? String
//                model.apiToken = hashMap["api_token"] as? String
//                model.tags = hashMap["tags"] as? Array<String>
//                return model
//            }
//        }
//        return nil
//    }
//
//    func convertUserModel() -> UserModel? {
//        let keychain = KeyChainHelper.init()
//        let hashMap = keychain.readDataFromKeyChain(data: "", withIdentifier: __userKeyChain) as? Dictionary<String, Any>
//        if  hashMap != nil {
//            let model: UserModel = UserModel()
//            model.userId = hashMap?["uid"] as? Int
//            model.nickName = hashMap?["nickname"] as? String
//            model.avatarId = hashMap?["avatar_id"] as? Int
//            model.avatar = hashMap?["avatar"] as? String
//            model.email = hashMap?["email"] as? String
//            model.phone = hashMap?["phone"] as? String
//            model.gold = hashMap?["gold"] as? Int
//            model.FP = hashMap?["FP"] as? Float
//            model.verify = hashMap?["verify"] as? String
//            model.isoCode = hashMap?["iso_code"] as? String
//            model.sex = hashMap?["sex"] as? Int
//            model.birthday = hashMap?["birthday"] as? Float
//            model.astrology = hashMap?["astrology"] as? String
//            model.apiToken = hashMap?["api_token"] as? String
//            model.tags = hashMap?["tags"] as? Array<String>
//            return model
//        }
//        return nil
//    }
//}
