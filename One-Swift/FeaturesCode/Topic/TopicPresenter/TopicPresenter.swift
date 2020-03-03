//
//  TopicPresenter.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import Foundation

struct TopicPresenter <bindView> where bindView: topicDelegate {
    var view : bindView?
    mutating func bindDataFromServer (view : bindView) {
        self.view = view;
        self.dataList = self.viewModel.getAryListData() 
    }
    
   lazy var dataList : Array<Any> = {
        let dataList = Array<Any>()
        return dataList;
    }()
    
    lazy var viewModel : TopicViewModel = {
        let viewModel = TopicViewModel.init()
        return viewModel;
    }()

   
    
    
}
