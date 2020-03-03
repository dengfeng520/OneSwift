//
//  ReadPresenter.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/3.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ReadPresenter <readView> where readView : ReadProtocol {
    var readView: ReadProtocol?
    
    
    lazy var bannerArray: [Any] = {
        let bannerArray: [Any] = Array<Any>.init()
        return bannerArray
    }()
    
    lazy var readingArray: [Any] = {
        let readingArray: [Any] = Array<Any>.init()
        return readingArray
    }()
    
}

// MARK: - Model和View绑定
extension ReadPresenter {
    func bindViewController(readView: readView) {
        self.readView = readView
    }
    
    func bindTopBanderArrayFromServer(success: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        HTTPRequest().sendArray(readingBannerRequest(parameter: ["":"" as AnyObject])) { dataAry,error in
            if dataAry?.count != 0 {
                self.bannerArray = dataAry!
                success(true,nil)
            } else {
                success(false,error!)
            }
        }
    }
    
    func bindReadingListFromServer(success: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        HTTPRequest().sendArray(readingListRequest(parameter: ["":"" as AnyObject])) { dataAry,error in
            if dataAry?.count != 0 {
                self.readingArray = dataAry!
                success(true,nil)
            } else {
                success(true,error!)
            }
        }
    }
}
