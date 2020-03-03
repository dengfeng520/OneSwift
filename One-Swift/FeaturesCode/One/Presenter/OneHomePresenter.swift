//
//  OneHomePresenter.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

 class OneHomePresenter <bindView> where bindView: OneHomeProtocol {
     var view : bindView?

    lazy var homeArray: [Any] = {
        let homeArray: [Any] = Array<Any>()
        return homeArray
    }()  
}

// MARK: - Model和View绑定
extension OneHomePresenter {
    func bindViewController(view: bindView) {
        self.view = view
    }
    
    func bindDataFromServer(success: @escaping (_ success: Bool, _ error: Error?) -> Void)  {
        HTTPRequest().sendArray(OneHomeRequest(parameter: ["":"" as AnyObject])) { dataAry,error in
            if dataAry?.count != 0 {
                self.homeArray = dataAry!
                success(true,nil)
            } else {
                success(false,error!)
            }
        }
    }
}

// MARK: - 用户点击Like按钮
extension OneHomePresenter {
    func updateLikeBtnUI(isSelect: Bool, senderTag: Int) -> Void {
        let model: OnePageModel = self.homeArray[senderTag] as! OnePageModel
        self.homeArray.remove(at: senderTag)
        if isSelect == true {
            model.praisenum = model.praisenum! + 1
        } else {
            model.praisenum = model.praisenum! - 1
        }
        model.select = isSelect
        self.homeArray.insert(model, at: senderTag)
        self.view!.updateLikeNumber(senderTag: senderTag)
    }
}

extension OneHomePresenter {
     func pullUpLoadMoreData() {
        
        
    }
}
