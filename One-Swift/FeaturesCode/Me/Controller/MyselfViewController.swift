//
//  MyselfViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/11.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MyselfViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.rowHeight = 55
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)

        // Do any additional setup after loading the view.
    }
    
   
}

extension MyselfViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    } 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyselfTableViewCell = MyselfTableViewCell(style: .default, reuseIdentifier: "MyselfTableViewCellID")
        
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
