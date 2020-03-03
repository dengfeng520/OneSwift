//
//  HTTPRequest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/19.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
}

protocol Request {
    var path: String {get}
    var method: HTTPMethod {get}
    var parameter: [String: AnyObject] {get}
    var host: String { get }
    associatedtype response: Decodable
}

extension Request {
    var parameter: [String: AnyObject] {
        return [:]
    }
}

protocol RequestSender {
    // 返回数组类型
    func sendArray<T: Request>(_ r: T, handler: @escaping (_ result: [Any]? ,_ error: Error?) -> Void)
    // 返回字典类型
    func sendReturnMap<T: Request>(_ r: T, handler: @escaping (_ result: AnyObject? ,_ error: Error?) -> Void)
}


protocol Decodable {
    static func jsonFromModel(json: Dictionary<String, Any>) -> Any?
}

func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
    if (!JSONSerialization.isValidJSONObject(jsonDic)) {
        print("is not a valid json object")
        return nil
    }
    let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
    return data
}

struct HTTPRequest: RequestSender {
  
    func sendArray<T>(_ r: T, handler: @escaping (_ result: [Any]? ,_ error: Error?) -> Void) where T : Request {
        let url = URL(string: r.host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        request.timeoutInterval = 30
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if data != nil {
                let json: Dictionary = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers)as! Dictionary<String,Any>
                if let retData = T.response.jsonFromModel(json: json) {
                    DispatchQueue.main.async {
                        handler((retData as! [Any]),nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        handler([],error!)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    handler([],error!)
                }
            }
        }
        task.resume()
    }
    
    func sendReturnMap<T>(_ r: T, handler: @escaping (_ result: AnyObject? ,_ error: Error?) -> Void) where T : Request {
        let url = URL(string: r.host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        request.timeoutInterval = 30
        if r.parameter.isEmpty == false {
            let postData: Dictionary<String, Any> = r.parameter as Dictionary<String, Any>
            let data = jsonToData(jsonDic: postData)
            request.httpBody = data
        }
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) {
            data, res, error in
            if data != nil {
                let json: AnyObject? = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as AnyObject
                if let retData = T.response.jsonFromModel(json: json as! Dictionary<String, Any>) {
                    DispatchQueue.main.async {
                        handler((retData as AnyObject),nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        handler(nil,error!)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil,error!)
                }
            }
        }
        task.resume()
    }
}

