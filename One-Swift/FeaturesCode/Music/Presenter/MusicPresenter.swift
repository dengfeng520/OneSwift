//
//  MusicPresenter.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusicPresenter <musicView> where musicView : MusicProtocol {
    var musicView: MusicProtocol?
    var musicIdList: Array<Any>? = nil
    var musicDelitsModel: MusicDetailModel? = nil
}

extension MusicPresenter {
    func bindMusicViewController(musicView: musicView) {
        self.musicView = musicView
    }
    
    func bindMusicIdArrayFromServer() {
        HTTPRequest().sendArray(musicIdListRequest()) { (dataAry, error) in
            if dataAry?.count != 0 {
                self.musicIdList = dataAry
                if dataAry?.count != 0 {
                    let musicId = dataAry?[0] as! String
                    self.bindMusicDetailFromServer(musicId: musicId)
                }
            }
        }
    }
    
    func bindMusicDetailFromServer(musicId: String) {
        let apiName: String = __apiMusicDetail + musicId
        HTTPRequest().sendReturnMap(musicDetailRequest(apiName: apiName)) { (hashMap, error) in
            self.musicDelitsModel = hashMap as? MusicDetailModel
            self.musicView?.convertJsonToModel?(model: hashMap as! MusicDetailModel)
        }
    }
    
}
