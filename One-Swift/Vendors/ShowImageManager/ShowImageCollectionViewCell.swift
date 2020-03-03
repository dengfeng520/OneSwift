//
//  ShowImageCollectionViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ShowImageCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImageView? = nil
    override init(frame: CGRect) {
        super.init(frame: frame)

        configUI();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
   func configUI() {
    photo = UIImageView.init()
    self.contentView.addSubview(photo!)
    photo?.translatesAutoresizingMaskIntoConstraints = false
    photo?.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
    photo?.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
    photo?.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
    photo?.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    let path : String = Bundle.main.path(forResource: "background", ofType: "webp")!
    photo?.image = UIImage.init(webPPath: path)
    photo?.contentMode = .scaleAspectFit
    
    }
    
}



