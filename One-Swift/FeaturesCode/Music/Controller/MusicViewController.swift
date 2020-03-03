//
//  MeViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class MusicViewController: UIViewController {

    var tableView: UITableView!
    var presenter: MusicPresenter<MusicViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Music";
        // Do any additional setup after loading the view.
        
        self.presenter = MusicPresenter<MusicViewController>.init()
        self.presenter.bindMusicViewController(musicView: self)
        self.presenter.bindMusicIdArrayFromServer()
        
        configUI()
    }
    
    func configUI() {
        self.tableView = UITableView()
        self.view.addSubview(self.tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 350
        self.tableView.register(UINib(nibName: "MusicDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "MusicDetailTableViewCellID")
    }
}

// MARK: - UITableViewDelegate
extension MusicViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - UITableViewDataSource
extension MusicViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: MusictopimageViewTableViewCell = MusictopimageViewTableViewCell.init(style: .default, reuseIdentifier: "MusictopimageViewTableViewCellID")
        let cell: MusicDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MusicDetailTableViewCellID", for: indexPath) as! MusicDetailTableViewCell

        
        return cell
    }
}

// MARK: - MusicProtocol
extension MusicViewController: MusicProtocol {
    func convertJsonToModel(model: MusicDetailModel) {
        print("ID====================\(String(describing: model.ID))")
    }
}

// MARK: - HiddenTabbarProtocol
extension MusicViewController: HiddenTabbarProtocol {
    override func viewDidAppear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
}
