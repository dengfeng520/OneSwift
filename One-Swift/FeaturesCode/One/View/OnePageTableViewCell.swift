//
//  OnePageTableViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/20.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class OnePageTableViewCell: UITableViewCell {

    @IBOutlet weak var topPhotoImage: UIImageView!
    @IBOutlet weak var photographerLab: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    @IBOutlet weak var authorLab: UILabel!
    @IBOutlet weak var likeBtn: UIButton!

    var clickLikeBtnClosures: ((_ index: Int, _ select: Bool) -> Void)?
    var clickContentClosures: ((_ index: Int) -> Void)?
    var clickPhotoClosures: ((_ index: Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.topPhotoImage.contentMode = UIView.ContentMode.scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bingCellDataWithModel(model: OnePageModel) -> Void {
        
        self.topPhotoImage.kf.setImage(with: URL(string: (model.hp_img_url)!), placeholder: UIImage.init(named: "user_header_image"), options: nil, progressBlock: nil, completionHandler: nil)
        let tapImageRecognizer: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(clickImageView(sender:)))
        tapImageRecognizer.isEnabled = true
        tapImageRecognizer.numberOfTouchesRequired = 1
        self.topPhotoImage.isUserInteractionEnabled = true
        self.topPhotoImage.addGestureRecognizer(tapImageRecognizer)
        
        self.photographerLab.text = "插画 " + "|" + " " + model.image_authors!
        
        self.contentLab.text = model.hp_content!
        let tapContentRecognizer: UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(clickContentLab(sender:)))
        tapContentRecognizer.isEnabled = true
        tapContentRecognizer.numberOfTouchesRequired = 1
        self.contentLab.isUserInteractionEnabled = true
        self.contentLab.addGestureRecognizer(tapContentRecognizer)

        self.authorLab.text = model.text_authors!
        
        self.likeBtn.superview?.layoutIfNeeded()
        self.likeBtn.badgeValue = String(model.praisenum!)
        self.likeBtn.badgeBGColor = UIColor.clear
        self.likeBtn.badgeTextColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.3)
        self.likeBtn.addTarget(self, action: #selector(clickLikeBtn(sender:)), for: .touchUpInside)
        if model.select == false {
            self.likeBtn.setImage(UIImage.init(named: "home_like"), for: .normal)
        } else {
            self.likeBtn.setImage(UIImage.init(named: "home_like_select"), for: .normal)
        }
    }
}

extension OnePageTableViewCell {
    @objc func clickLikeBtn(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.clickLikeBtnClosures!(sender.tag, sender.isSelected)
    }
}

extension OnePageTableViewCell {
    @objc func clickContentLab(sender: UITapGestureRecognizer) {
        self.clickContentClosures!(self.likeBtn.tag)
    }
}

extension OnePageTableViewCell {
    @objc func clickImageView(sender: UITapGestureRecognizer) {
        self.clickPhotoClosures!(self.likeBtn.tag)
    }
}
