//
//  OnePageViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Lottie


class OnePageViewController: UIViewController {
    var homePresenter: OneHomePresenter<OnePageViewController>!
//    var refreshAnimationView: AnimationView? = nil
//    var pullUpAnimationView: AnimationView? = nil
    var socket: SocketClient!
    var refreshTopConstrait: NSLayoutConstraint? = nil
    var lastContentOffsetY: CGFloat = 0
    var isTouch: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "One";
        self.edgesForExtendedLayout = UIRectEdge.left
        
        configUI()
        configSocket()
    }
    
    func configSocket() {
        self.socket = SocketClient.shared
        self.socket.createMobileSocket()
    }
    
    func configUI() -> Void {
        showLoadingView()
        configPresenter()
        configRefresh()
        configPullUpAnimationView()
        configRightBarBtn()
    }
    
    func configRightBarBtn() {
        let image = UIImage.init(named: "face")?.withRenderingMode(.alwaysOriginal)
        let rightBtn = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(clickBarRightBtn))
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    @objc func clickBarRightBtn() {
        let model = UserModel().convertUserModel()
        if model == nil {
            self.present(LoginViewController(), animated: true, completion: nil)
        } else {
            self.navigationController?.pushViewController(UniverseMainViewController(), animated: true)
        }
    }

    func configPresenter() {
        self.homePresenter = OneHomePresenter<OnePageViewController>.init()
        self.homePresenter.bindViewController(view: self)
        bindPresenterFromServer()
    }
    
    func bindPresenterFromServer() {
        weak var weakSelf = self
        self.homePresenter.bindDataFromServer { (success, error) in
            weakSelf!.hiddenLoadingView()
            if success == true {
                weakSelf!.tableView.reloadData()
            } else {
                weakSelf!.showEmptyView()
            }
        }
    }
    
    func configRefresh() {
        let path: String = Bundle.main.path(forResource: "Refresh", ofType: "json")!
        self.refreshAnimationView = AnimationView.init(filePath: path)
        self.view.addSubview(self.refreshAnimationView!)
        self.refreshAnimationView?.loopMode = .loop
        self.refreshAnimationView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.refreshAnimationView?.translatesAutoresizingMaskIntoConstraints = false
        self.refreshTopConstrait = self.refreshAnimationView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -28)
        self.refreshTopConstrait?.isActive = true
        self.refreshAnimationView?.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.refreshAnimationView?.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.refreshAnimationView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.refreshAnimationView?.isHidden = true
    }
    
    func configPullUpAnimationView() {
        let path: String = Bundle.main.path(forResource: "TopicLoading", ofType: "json")!
        self.pullUpAnimationView = AnimationView.init(filePath: path)
        self.view.addSubview(self.pullUpAnimationView!)
        self.pullUpAnimationView?.loopMode = .loop
        self.pullUpAnimationView?.contentMode = UIView.ContentMode.scaleAspectFit
        self.pullUpAnimationView?.translatesAutoresizingMaskIntoConstraints = false
        self.pullUpAnimationView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
        self.pullUpAnimationView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.pullUpAnimationView?.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.pullUpAnimationView?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.pullUpAnimationView?.isHidden = true
    }
   
    lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        self.view.addSubview(tableView);
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "OnePageTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OnePageTableViewCellID")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 330
        tableView.backgroundColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        return tableView
    }()
}

// MARK: - UITableViewDelegate
extension OnePageViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homePresenter.homeArray.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
}

// MARK: - UITableViewDataSource
extension OnePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OnePageTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "OnePageTableViewCellID", for: indexPath) as? OnePageTableViewCell
        let model: OnePageModel = self.homePresenter.homeArray[indexPath.row] as! OnePageModel
        cell?.bingCellDataWithModel(model: model)
        cell?.likeBtn.tag = indexPath.row as Int
     
        weak var weakSelf = self
        cell?.clickLikeBtnClosures = {(_ btnTag: Int, _ select: Bool) -> Void in
            weakSelf?.homePresenter.updateLikeBtnUI(isSelect: select, senderTag: btnTag)
        }
        
        cell?.clickContentClosures = {(_ sendTag: Int) -> Void in
            weakSelf?.pushOneGraphicDetailsView(senderTag: sendTag)
        }
        
        cell?.clickPhotoClosures = {(_ sendTag: Int) -> Void in
            weakSelf?.pushShowImageView(senderTag: sendTag)
        }
        
        if indexPath.row == self.homePresenter.homeArray.count - 1 {
            cell!.separatorInset = UIEdgeInsets(top: 0, left: self.view.bounds.size.width, bottom: 0, right: 0)
        }
        
        return cell!;
    }
    
    func pushOneGraphicDetailsView(senderTag: Int) {
        
        self.navigationController?.pushViewController(TopicMainViewController(), animated: true)
    }
    
    func pushShowImageView(senderTag: Int) {
//        let imageView: ShowImageViewController = ShowImageViewController.init()
//        imageView.modalPresentationStyle = .custom
//        self.present(imageView, animated: true) {}
        let model: OnePageModel = self.homePresenter.homeArray[senderTag] as! OnePageModel
        let detailsView = OneGraphicDetailsViewController.init()
        detailsView.oneModel = model
        self.navigationController?.pushViewController(detailsView, animated: true)
        
    }
}

// MARK: - OneHomeProtocol
extension OnePageViewController: OneHomeProtocol {
    func pullUpLoadMore() {
       
    }
    
    func updateLikeNumber(senderTag: Int) {
        let index: IndexPath = IndexPath.init(row: senderTag, section: 0)
        self.tableView.reloadRows(at: [index], with: .none)
    }
}

// MARK: - EmptyDataSetProtocol
extension OnePageViewController: EmptyDataSetProtocol {
    func showEmptyView() {
        addEmptyView(type: .loadErrorType, iconName: "loading_error", tipTitle: "Loading failed, please check the network", action: #selector(clickRetryBtn(sender:)))
    }
    
    func hiddenEmptyView() {
        removeEmptyView()
    }
    
    @objc func clickRetryBtn(sender: UIButton) {
       bindPresenterFromServer()
    }
    
    func showLoadingView() {
        addLoadingView(type: .loadingType)
    }
    
    func hiddenLoadingView() {
        removeLoading()
    }
}

// MARK: - UIScrollViewDelegate
extension OnePageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < self.lastContentOffsetY && self.isTouch == true {
            self.refreshAnimationView?.isHidden = false
        }
        let maxBottomY: CGFloat = scrollView.contentOffset.y + self.tableView.frame.size.height
        if maxBottomY > self.tableView.contentSize.height + 50 && self.isTouch == true {
            self.pullUpAnimationView?.isHidden = false
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.isTouch = true
        self.lastContentOffsetY = scrollView.contentOffset.y;
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            if (scrollView.contentOffset.y < -70.0 && self.refreshAnimationView?.isAnimationPlaying == false) {
               startPlayRefesgAnimation()
            }
            
            let maxBottomY: CGFloat = scrollView.contentOffset.y + self.tableView.frame.size.height
            if (maxBottomY > self.tableView.contentSize.height + 50 && self.pullUpAnimationView?.isAnimationPlaying == false) {
                startPlayPullUpAnimation()
            }
        }
    }
    
    func startPlayRefesgAnimation() {
        self.refreshAnimationView?.play()
        self.tableView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 0, right: 0)
        weak var weakSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            weakSelf!.refreshAnimationView?.stop()
            UIView.animate(withDuration: 0.35, animations: {
                weakSelf!.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                weakSelf!.refreshTopConstrait!.constant = -30
                weakSelf!.refreshAnimationView?.updateConstraintsIfNeeded()
            }) { (finished) in
                weakSelf!.refreshAnimationView?.isHidden = true
            }
        })
    }
    
    func startPlayPullUpAnimation() {
        self.pullUpAnimationView?.play()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        weak var weakSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            weakSelf!.pullUpAnimationView?.stop()
            UIView.animate(withDuration: 0.35, animations: {
                weakSelf!.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                weakSelf!.tableView.updateConstraintsIfNeeded()
            }) { (finished) in
                weakSelf!.pullUpAnimationView?.isHidden = true
            }
        })
    }
}

// MARK: - OneBackgroundProtocol
extension OnePageViewController: OneBackgroundProtocol {
    override func loadView() {
        super.loadView()
        loadBackgroundImage()
    }
}

// MARK: - HiddenTabbarProtocol
extension OnePageViewController: HiddenTabbarProtocol {
    override func viewDidAppear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
}

