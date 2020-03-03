//
//  BannerCollectionViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/6.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    var bannerImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
    }
    
    func configUI() {
        bannerImage = UIImageView.init()
        self.contentView.addSubview(bannerImage)
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        bannerImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        bannerImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        bannerImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        bannerImage.contentMode = UIView.ContentMode.scaleToFill
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
