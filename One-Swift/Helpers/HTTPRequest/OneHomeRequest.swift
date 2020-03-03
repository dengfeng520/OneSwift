//
//  OneHomeRequest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/3.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation


extension OnePageModel: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
        return OnePageModel().jsonFromModel(json: json)
    }
}

// MARK: - 首页
struct OneHomeRequest: Request {
    typealias response = OnePageModel
    var parameter: [String : AnyObject]
    var path: String {
        return __apiHomePageMore
    }
    var host: String {
        return __apiServerAddress
    }
    let method: HTTPMethod = .GET
}

