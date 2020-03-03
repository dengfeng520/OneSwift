//
//  TopicMainTableViewCell.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class TopicMainTableViewCell: UITableViewCell {
    var headerImg : UIImageView!
    var userNameLab : UILabel!
    var topicInfoLab : UILabel!
    var likeLab : UILabel!
    
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
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.contentView.frame.size.width = __screenWidth
        configUI()
    }
    
    func configUI() {
        
       
        headerImg = UIImageView.init()
        self.contentView .addSubview(headerImg)
        headerImg.translatesAutoresizingMaskIntoConstraints = false
        headerImg.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        headerImg.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        headerImg.widthAnchor.constraint(equalToConstant: 32).isActive = true;
        headerImg.heightAnchor.constraint(equalToConstant: 32).isActive = true;
        
        headerImg.contentMode = UIView.ContentMode.scaleToFill
        headerImg.layer.cornerRadius = 16
        
        userNameLab = UILabel.init()
        self.contentView .addSubview(userNameLab)
        userNameLab.translatesAutoresizingMaskIntoConstraints = false
        userNameLab.centerYAnchor.constraint(equalTo: headerImg.centerYAnchor, constant: 0).isActive = true
        userNameLab.leftAnchor.constraint(equalTo:headerImg.rightAnchor , constant: 8).isActive = true
        userNameLab.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        userNameLab.heightAnchor .constraint(equalToConstant: 20).isActive = true
        userNameLab.font = UIFont.init(name: "Montserrat-Bold", size: 12)
        userNameLab.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        
        topicInfoLab = UILabel.init()
        self.contentView.addSubview(topicInfoLab)
        topicInfoLab.translatesAutoresizingMaskIntoConstraints = false
        topicInfoLab.topAnchor.constraint(equalTo: headerImg.bottomAnchor, constant: 8).isActive = true
        topicInfoLab.leftAnchor.constraint(equalTo: headerImg.rightAnchor, constant: 8).isActive = true
        topicInfoLab.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        topicInfoLab.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true;
        topicInfoLab.font = UIFont.init(name: "Montserrat-SemiBold", size: 12)
        topicInfoLab.numberOfLines = 0
        topicInfoLab.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    }
    
    func topicDataWithModel(model : TopicModel)  {
        headerImg.image = UIImage.init(named: "user_header_image")
        let name : String = model.nickname!
        let emoji : String = FormatEmoji.emojiFlag(regionCode: model.iso_code!)!
        userNameLab.text = name + "  " + emoji;
        topicInfoLab.text = String(model.content!);
        let imageAry : Array = model.images! as Array
        if  imageAry.count != 0 && imageAry.count == 1 {
            settingOnlyOnePicturesWithLayout(imageURLWithString: imageAry[0] )
        } else {
            settingRowMultiplePicturesWithLayout(imageArray: imageAry)
        }
    }
    
    func settingOnlyOnePicturesWithLayout(imageURLWithString : String)  {
        let photo : UIImageView = UIImageView.init()
        self.contentView.addSubview(photo)
        let itemHeight : CGFloat = (self.contentView.frame.size.width - 75 - 16) / 2
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.topAnchor.constraint(equalTo: topicInfoLab.bottomAnchor, constant: 8).isActive = true
        photo.leftAnchor.constraint(equalTo: headerImg.rightAnchor, constant: 8).isActive = true
        photo.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -15).isActive = true
        photo.heightAnchor.constraint(equalToConstant: itemHeight).isActive = true
        photo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        photo.kf.setImage(with: URL(string: imageURLWithString), placeholder: UIImage.init(named: "user_header_image"), options: nil, progressBlock: nil, completionHandler: nil)
        photo.contentMode = UIView.ContentMode.scaleAspectFit 
    }
    
    func settingRowMultiplePicturesWithLayout(imageArray : Array<Any>) {
        var lastPhoto : UIImageView?
        let rowFew : CGFloat
        if imageArray.count == 2 || imageArray.count == 3 || imageArray.count == 4 {
            rowFew = 2
        } else {
            rowFew = 3
        }
        let itemWidth : CGFloat = (self.contentView.frame.size.width - 75 - 16) / rowFew
        let maxWidth : CGFloat = self.contentView.frame.size.width - 75 - 8
        var rowWidth : CGFloat = 0
        for(idx, obj) in imageArray.enumerated() {
            let photo : UIImageView = UIImageView.init()
            self.contentView.addSubview(photo)
            photo.translatesAutoresizingMaskIntoConstraints = false
            photo.widthAnchor.constraint(equalToConstant: itemWidth).isActive = true
            photo.heightAnchor.constraint(equalToConstant: itemWidth).isActive = true
            if idx == 0 {
                photo.topAnchor.constraint(equalTo: topicInfoLab.bottomAnchor, constant: 8).isActive = true
                photo.leftAnchor.constraint(equalTo: headerImg.rightAnchor, constant: 8).isActive = true
                rowWidth = itemWidth
            } else {
                if rowWidth + 8 > maxWidth  {
                    photo.topAnchor.constraint(equalTo: lastPhoto!.bottomAnchor, constant: 8).isActive = true
                    photo.leftAnchor.constraint(equalTo: headerImg.rightAnchor, constant: 8).isActive = true
                    rowWidth = itemWidth + 8
                } else {
                    photo.topAnchor.constraint(equalTo: lastPhoto!.topAnchor, constant: 0).isActive = true
                    photo.leftAnchor.constraint(equalTo: lastPhoto!.rightAnchor, constant: 8).isActive = true
                    rowWidth = rowWidth + itemWidth + 8
                }
            }
            if idx == imageArray.count - 1 {
                photo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
            }
            lastPhoto = photo
//            photo.kf.setImage(with: URL(string: obj as! String), placeholder: UIImage.init(named: "user_header_image"), options: nil, progressBlock: nil, completionHandler: nil)
            photo.contentMode = UIView.ContentMode.scaleToFill
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
