//
//  ProtocolTest.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

protocol touchBtnDelegate : NSObjectProtocol {
    
    func touchTestBtn(sendTag : Int);

}

class ProtocolTest: UIView {
    weak var delegate : touchBtnDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.testBtn.addTarget(self, action: #selector(clickTestBtn(sender:)), for: .touchUpInside);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickTestBtn(sender : UIButton)  {
        if delegate != nil {
            delegate?.touchTestBtn(sendTag: sender.tag);
        }
    }
    
    // MARK: - lazy data
    lazy var testBtn : UIButton = {
        let testBtn = UIButton.init();
        self.addSubview(testBtn);
        testBtn.translatesAutoresizingMaskIntoConstraints = false;
        testBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true;
        testBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true;
        testBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true;
        testBtn.heightAnchor.constraint(equalToConstant: 44).isActive = true;
        testBtn.backgroundColor = UIColor.red;
        testBtn.tag = 10086;
        return testBtn;
    }();
}
