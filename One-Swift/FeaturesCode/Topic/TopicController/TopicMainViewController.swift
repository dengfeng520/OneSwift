//
//  TopicMainViewController.swift
//  ProtocolDemo-Swift
//
//  Created by rp.wang on 2019/5/15.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Lottie

class TopicMainViewController: UIViewController {
    
    var lastContentOffsetY: CGFloat = 0
    var isTouch: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        self.title = "Topic"
        configUI();
    }
    
    func configUI () {
        loadBackgroundImage()
        self.topicPresenter.bindDataFromServer(view: self)
        self.tableView.reloadData()
    }

     lazy var topicPresenter : TopicPresenter = { () -> TopicPresenter<TopicMainViewController> in
        let topicPresenter = TopicPresenter<TopicMainViewController>.init();
        return topicPresenter;
    }();
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init();
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        } else {
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        }
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        return tableView
    }()
    
   lazy var refreshAnimationView: AnimationView = {
        let path : String = Bundle.main.path(forResource: "Refresh", ofType: "json")!;
        let refreshAnimationView = AnimationView.init(filePath: path)
        view.addSubview(refreshAnimationView)
        view.insertSubview(refreshAnimationView, belowSubview: self.tableView)
        refreshAnimationView.loopMode = .loop
        refreshAnimationView.contentMode = UIView.ContentMode.scaleAspectFit
        refreshAnimationView.translatesAutoresizingMaskIntoConstraints = false
        refreshAnimationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        refreshAnimationView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        refreshAnimationView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        refreshAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        refreshAnimationView.isHidden = true
        
        return refreshAnimationView
    }()
}

// MARK: - topicDelegate
extension TopicMainViewController: topicDelegate {
    func updateCellUI() {
        
    }
}

// MARK: - UITableViewDelegate
extension TopicMainViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.topicPresenter.dataList.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model : TopicModel = self.topicPresenter.dataList[indexPath.row] as! TopicModel
        let inviteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TopicDetailsViewController") as! TopicDetailsViewController;
        inviteVC.model = model
        self.navigationController?.pushViewController(inviteVC, animated: true);
    }

}

// MARK: - UITableViewDataSource
extension TopicMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TopicMainTableViewCell = TopicMainTableViewCell(style: .subtitle, reuseIdentifier: "TopicMainTableViewCellIdentifier")
        let model : TopicModel = self.topicPresenter.dataList[indexPath.row] as! TopicModel
        cell.topicDataWithModel(model: model)
        
        if indexPath.row == self.topicPresenter.dataList.count - 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: self.view.bounds.size.width, bottom: 0, right: 0)
        } else {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        }
        return cell;
    }
}

// MARK: - OneBackgroundProtocol
extension TopicMainViewController: OneBackgroundProtocol {
    
}

extension TopicMainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < self.lastContentOffsetY && self.isTouch == true {
           self.refreshAnimationView.isHidden = false
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isTouch = true
        self.lastContentOffsetY = scrollView.contentOffset.y;
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            if (scrollView.contentOffset.y < -70.0 && self.refreshAnimationView.isAnimationPlaying == false) {
                starPlayRefreshAnimation()
            }
        }
    }

    func starPlayRefreshAnimation() {
        self.refreshAnimationView.play()
        self.tableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        weak var weakSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            weakSelf!.refreshAnimationView.stop()
            UIView.animate(withDuration: 0.35, animations: {
                weakSelf!.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

                weakSelf!.tableView.setNeedsFocusUpdate()
            }) { (finished) in
                weakSelf!.refreshAnimationView.isHidden = true
            }
        })
    }
    
}
