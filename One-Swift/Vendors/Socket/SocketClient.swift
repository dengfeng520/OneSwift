//
//  SocketClient.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

class SocketClient: NSObject {
    
    var connectionState : Bool? = false
    var loginState : Bool? = false
//    var socketClient : TCPClient? = nil
    weak var socketDelegate : SocketProtocol?

    static let shared = SocketClient()
    
    func createMobileSocket() {
//        if self.socketClient == nil {
//            self.socketClient = TCPClient(address: __socketHost, port: __socketPort)
//            switch self.socketClient!.connect(timeout: 10) {
//            case .success:
//                self.connectionState = true
//                print("======11111")
//            case .failure(let error):
//                print("======\(error)")
//                self.connectionState = false
//            }
//        }
    }

    
}
