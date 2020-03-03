//
//  UniverseViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/7/2.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class UniverseMainViewController: UIViewController {

    var tableView: UITableView!
    var presenter: UniversePresenter<UniverseMainViewController>!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "universe"
        self.view.backgroundColor = UIColor.white
        self.presenter = UniversePresenter<UniverseMainViewController>.init()
        self.presenter.bindDataFromServer(view: self)
        configUI()
    }

    func configUI() {
        self.tableView = UITableView.init()
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "UniverseMainPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "UniverseMainPlaceTableViewCellID")
        self.tableView.register(UINib(nibName: "UniverseMainTableViewCell", bundle: nil), forCellReuseIdentifier: "UniverseMainTableViewCellID")
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 220
        self.tableView.backgroundColor = UIColor.clear
    }
}

extension UniverseMainViewController: UniverseProtocol {
    
}



