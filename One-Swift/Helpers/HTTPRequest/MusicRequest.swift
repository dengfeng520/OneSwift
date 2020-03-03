//
//  MusicRequest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

// MARK: - musicId List
struct musicIdListRequest: Request {
    typealias response = musicIdListRequest
    var path: String {
        return __apiMusicIdList
    }
    var host: String {
        return __apiServerAddress
    }
    let method: HTTPMethod = .GET
}

extension musicIdListRequest: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
       return MusicModel().musicIdListJsonFronModel(json: json)
    }
}

// MARK: -  music Details
struct musicDetailRequest: Request {
    typealias response = musicDetailRequest
    let apiName: String
    var path: String {
        return apiName
    }
    var host: String {
        return __apiServerAddress
    }
    let method: HTTPMethod = .GET
}

extension musicDetailRequest: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
        return MusicDetailModel().convertDetailsJsonToModel(json: json)
    }
}
