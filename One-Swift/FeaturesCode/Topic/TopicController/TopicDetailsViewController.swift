//
//  TopicDetailsViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/16.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class TopicDetailsViewController: UIViewController {
    var model: TopicModel? = nil
    
    var topicPresenter : TopicPresenter<TopicDetailsViewController>!
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigUI()
    }
    
    func cofigUI () {
        self.topicPresenter = TopicPresenter<TopicDetailsViewController>.init()
        self.topicPresenter.bindDataFromServer(view: self);
        
        self.tabeleView.reloadData()
    }
    
    lazy var tabeleView: UITableView = {
        let tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        let nib = UINib(nibName: "OnePageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OnePageTableViewCellID")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        return tableView
    }()
}


extension TopicDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension TopicDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             let cell : TopicMainTableViewCell = TopicMainTableViewCell(style: .subtitle, reuseIdentifier: "TopicDetailsCommentTableViewCellID")
            
            cell.topicDataWithModel(model: self.model!)
            
            return cell
        } else {
            let cell: OnePageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "OnePageTableViewCellID", for: indexPath) as? OnePageTableViewCell

            
            
            return cell!
        }
       
    }
}

// MARK: - topicDelegate
extension TopicDetailsViewController: topicDelegate {

    func bindDataSurce(list: NSArray) {
        
    }
    
    func updateCellUI() {
        
    }
}
