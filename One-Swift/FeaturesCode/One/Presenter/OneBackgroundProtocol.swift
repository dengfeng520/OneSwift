//
//  OneBackgroundProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/23.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit


protocol OneBackgroundProtocol: UIViewController {

}

extension OneBackgroundProtocol {
    func loadBackgroundImage() {
        let backgroundImg: UIImageView = UIImageView.init()
        view.addSubview(backgroundImg)
        backgroundImg.frame = view.bounds
        let path : String = Bundle.main.path(forResource: "background", ofType: "webp")!
        backgroundImg.image = UIImage.init(webPPath: path)
    }
    
}
