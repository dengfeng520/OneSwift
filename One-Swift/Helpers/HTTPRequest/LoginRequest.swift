//
//  LoginRequest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/7/2.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

struct LoginRequest: Request {
    typealias response = LoginRequest
    let apiName: String
    var parameter: [String : AnyObject]
    var path: String {
        return apiName
    }
    var host: String {
        return __devServerAPI
    }
    let method: HTTPMethod = .POST
}


extension LoginRequest: Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any? {
        return UserModel().userJSONToModel(json: json)
    }
}
