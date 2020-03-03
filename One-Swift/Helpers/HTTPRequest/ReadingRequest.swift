//
//  ReadRequest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/3.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation


// MARK: - 阅读Banner数组
extension ReadingBannerModel: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
        return ReadingBannerModel().readJSONFromModel(json: json)
    }
}

struct readingBannerRequest: Request {
    typealias response = ReadingBannerModel
    var parameter: [String : AnyObject]
    var path: String {
        return __apiReadingCarousel
    }
    var host: String {
        return __apiServerAddress
    }
    let method: HTTPMethod = .GET
}

// MARK: - 阅读文章列表
extension readingListRequest: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
        return ReadingListModel().readingListJSONFromModel(json: json)
    }
}

struct readingListRequest: Request {
    typealias response = readingListRequest
    var parameter: [String : AnyObject]
    var path: String {
        return __apiReadingIndex
    }
    var host: String {
        return __apiServerAddress
    }
    let method: HTTPMethod = .GET
}

