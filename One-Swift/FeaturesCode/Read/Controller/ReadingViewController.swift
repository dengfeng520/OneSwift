//
//  AllViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/4/28.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import RPToastView

class ReadingViewController: UIViewController,ReadProtocol {

    var bannerView: TopBannerView!
    var readCollectView: UICollectionView!
    var readPresenter: ReadPresenter<ReadingViewController>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Read";

        // Do any additional setup after loading the view.
        configUI()
        bindModel()
        RPToastView.show(mode: .loopAndTextMode, isView: self.view, text: "Loading...")

    }
    
    func configUI() {
        bannerView = TopBannerView.init(frame: CGRect.zero)
        view.addSubview(bannerView)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        bannerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        bannerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        bannerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        bannerView.clickCurrentIndex = {(_ currentIndex: Int, _ isSelect: Bool) -> Void in
            self.pushBannerDetailsView(index: currentIndex)
        }
        
        
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        readCollectView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        view.addSubview(readCollectView)
        readCollectView.layer.backgroundColor = UIColor.white.cgColor
        readCollectView.translatesAutoresizingMaskIntoConstraints = false
        readCollectView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        readCollectView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        readCollectView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        readCollectView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 0).isActive = true
        readCollectView.register(ReadingCollectionViewCell.self, forCellWithReuseIdentifier: "ReadingCollectionViewCellID")
        readCollectView.delegate = self
        readCollectView.dataSource = self
        readCollectView.isPagingEnabled = true
        readCollectView.showsHorizontalScrollIndicator = false
    }
    
    func bindModel() {
        weak var weakSelf = self
        self.readPresenter = ReadPresenter<ReadingViewController>.init()
        self.readPresenter.bindViewController(readView: self)
        self.readPresenter.bindTopBanderArrayFromServer { (success, error) in
//            weakSelf!.bannerView.updateBannerArray(imageAry: (weakSelf?.readPresenter.bannerArray)!)
        }
        self.readPresenter.bindReadingListFromServer { (success, error) in
            weakSelf?.readCollectView.reloadData()
//            RPToastView.hidden(animation: true)
        }
    }
    
    func pushBannerDetailsView(index: Int) {
        let model: ReadingBannerModel = self.readPresenter.bannerArray[index] as! ReadingBannerModel
        let bannerDetailsView = BannerDetailsViewController.init()
        bannerDetailsView.webURL = model.pv_url
        self.navigationController?.pushViewController(bannerDetailsView, animated: true)
    }
}

// MARK: - HiddenTabbarProtocol
extension ReadingViewController: HiddenTabbarProtocol {
    override func viewDidAppear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.isHiddenTabbar();
    }
}

extension ReadingViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: __screenWidth, height: __screenHeight - 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
}

extension ReadingViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.readPresenter.readingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ReadingCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReadingCollectionViewCellID", for: indexPath) as! ReadingCollectionViewCell
        
        let arrray: [Any] = self.readPresenter.readingArray[indexPath.row] as! [Any]
        cell.configDataWithAssayList(dataAry: arrray, index: indexPath.row)
        weak var weakSelf = self
        cell.clickReadContentIndex =  {(_ index: Int) -> Void in
            weakSelf?.pushDetailsVC()
            
        }
        return cell
    }
    
    func pushDetailsVC() {
        self.navigationController?.pushViewController(ArticleDetailsViewController(), animated: true)
//        RPToastView.show(withMode(text: "Loading...", mode: .mixedModel, addView: self.view!))
//        RPToastView.show(withActivityMode(addView: self.view))
//        RPToastView.show(onlyText(isText: "Loading....", isView: self.view, isTime: 1.5))
    }
}

extension ReadingViewController: UICollectionViewDelegateFlowLayout {
    
}
