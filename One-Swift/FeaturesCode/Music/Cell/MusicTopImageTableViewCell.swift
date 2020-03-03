//
//  MusictopimageViewTableViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusictopimageViewTableViewCell: UITableViewCell {
    
    var topimageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.topimageView = UIImageView()
        self.contentView.addSubview(self.topimageView)
        self.topimageView.translatesAutoresizingMaskIntoConstraints = false
        self.topimageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.topimageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        self.topimageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        self.topimageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
