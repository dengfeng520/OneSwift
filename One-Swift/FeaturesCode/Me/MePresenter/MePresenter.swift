//
//  MePresenter.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/25.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

struct MePresenter <bindView> where bindView: MeProtocol {
    var view : bindView!
    
    mutating func bindDataFromServer (view : bindView) {
        self.view = view;
    }
}

extension MePresenter {
    func loginFromServer(postData: Dictionary<String, Any>) {
        HTTPRequest().sendReturnMap(LoginRequest(apiName: __devAuthLogin, parameter: postData as [String : AnyObject])) { (map, error) in
            let userModel = map as! UserModel
            print("==================\(String(describing: userModel.userId))")
            
            self.view.userLoginSeccuss(model: userModel)
        }
    }

}
