//
//  ReadingCollectionViewCell.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ReadingCollectionViewCell: UICollectionViewCell {
    var tableView: UITableView!
    var readList: [Any]!
    var clickReadContentIndex: ((_ index: Int) -> Void)?
    var currentIndex: Int!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        tableView = UITableView.init()
        self.contentView.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 113
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -25).isActive = true
        tableView.register(UINib(nibName: "ReadingTableViewCell", bundle: nil), forCellReuseIdentifier: "ReadingTableViewCellID")
        tableView.showsVerticalScrollIndicator = false
    }
    
}

extension ReadingCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.clickReadContentIndex!(indexPath.row)
    }
}

extension ReadingCollectionViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.readList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReadingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReadingTableViewCellID", for: indexPath) as! ReadingTableViewCell
        if self.currentIndex == 0 {
            let model: essayModel = self.readList![indexPath.row] as! essayModel
            cell.convertEssayWithModel(model: model)
        } else if self.currentIndex == 1 {
            let model: serialModel = self.readList![indexPath.row] as! serialModel
            cell.converSerialWithModel(model: model)
        } else if self.currentIndex == 2 {
            let model: questionModel = self.readList![indexPath.row] as! questionModel
            cell.converquestionWithModel(model: model)
        }
        
        
        return cell
    }
    
    
}


extension ReadingCollectionViewCell {
    func configDataWithAssayList(dataAry: [Any], index: Int) {
        self.currentIndex = index
        self.readList = dataAry
        self.tableView.reloadData()
    }
}
