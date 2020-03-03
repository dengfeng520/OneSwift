//
//  ReadingTableViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ReadingTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.type.layer.borderColor = UIColor.init(red: 84/255, green: 174/255, blue: 242/255, alpha: 1).cgColor
        self.type.layer.masksToBounds = true
        self.type.layer.borderWidth = 1.2
        self.type.layer.cornerRadius = 5
        self.type.textColor = UIColor.init(red: 84/255, green: 174/255, blue: 242/255, alpha: 1)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ReadingTableViewCell {
    func convertEssayWithModel(model: essayModel) {
        self.title.text = model.hp_title
        let authAry = model.author
        if authAry!.count != 0 {
            let authModel: authorModel = authAry![0] as! authorModel
            self.subTitle.text = authModel.user_name
        }
        self.content.text = model.guide_word
        self.type.text = "短篇"
    }
    
    func converSerialWithModel(model: serialModel) {
        self.title.text = model.title
        let authModel: authorModel = model.author!
        self.subTitle.text = authModel.user_name
        self.content.text = model.excerpt
        self.type.text = "连载"
    }
    
    func converquestionWithModel(model: questionModel) {
        self.title.text = model.question_title
        let authAry = model.author_list
        if authAry!.count != 0 {
            let authModel: authorModel = authAry![0]
            self.subTitle.text = authModel.user_name
        }
        self.content.text = model.answer_content
       self.type.text = "问答"
    }
}
