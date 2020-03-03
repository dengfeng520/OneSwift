//
//  OneGraphicDetailsViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class OneGraphicDetailsViewController: UIViewController {
    
    var oneModel: OnePageModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        print("===============",oneModel!.text_authors as Any)
    }
    
    func configUI() {
        self.title = "One"
        loadBackgroundImage();
    }
    
    lazy var tabeleView: UITableView = {
        let tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        return tableView
    }()

}

extension OneGraphicDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension OneGraphicDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "OneGraphicDetailsTableViewCellID", for: indexPath)
        
        return cell
    }
}

extension OneGraphicDetailsViewController: OneBackgroundProtocol {
    
}

