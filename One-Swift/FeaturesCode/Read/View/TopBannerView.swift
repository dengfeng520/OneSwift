//
//  TopBannerView.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/17.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Kingfisher

class TopBannerView: UIView {
    
    var bannerView: UICollectionView!
    var pageControl: UIPageControl!
    var upperIndex: Int!
    var currentIndex: Int!
    var nextIndex: Int!
    var time: Timer!
    var clickCurrentIndex: ((_ index: Int, _ select: Bool) -> Void)?


    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageArray: Array<Any> = {
        let imageArray = Array.init() as [Any]
        return imageArray
    }()
    
    func configUI() {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        bannerView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        self.addSubview(bannerView!)
        bannerView?.delegate = self
        bannerView?.dataSource = self;
        bannerView?.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCellID")
        bannerView?.translatesAutoresizingMaskIntoConstraints = false
        bannerView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        bannerView?.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        bannerView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        bannerView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        bannerView?.backgroundColor = UIColor.groupTableViewBackground
        bannerView?.isPagingEnabled = true
        
        
        pageControl = UIPageControl.init()
        self.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.heightAnchor.constraint(equalToConstant: 15).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        pageControl.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.8).isActive = true
        pageControl.pageIndicatorTintColor = UIColor.red
        
        
        upperIndex = 0
        currentIndex = 0
        nextIndex = 1
        
        if #available(iOS 10.0, *) {
            
            weak var weakSelf = self
            time = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (time) in
                weakSelf!.makeInfiniteScrolling()
                let nowIndex: IndexPath = IndexPath.init(row: weakSelf!.currentIndex, section: 0)
                UIView.animate(withDuration: 0.5, animations: {
                    weakSelf!.bannerView.scrollToItem(at: nowIndex, at: UICollectionView.ScrollPosition.init(rawValue: 0), animated: true)

                }, completion: { (finished) in

                })
            })
            // 加入runloop
            RunLoop.current.add(time, forMode: .default)
            RunLoop.current.run()
        } else {
            
        }
    }
}

// MARK: - bindData
extension TopBannerView {
    func updateBannerArray(imageAry: Array<Any>) {
        pageControl.numberOfPages = imageAry.count
        pageControl.currentPage = 0
        self.imageArray = imageAry
        bannerView?.reloadData()
    }
}

extension TopBannerView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 闭包传值
        self.clickCurrentIndex!(Int(indexPath.row), true)
    }
}

extension TopBannerView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCellID", for: indexPath) as! BannerCollectionViewCell
        
        let model: ReadingBannerModel = self.imageArray[indexPath.row] as! ReadingBannerModel
        
//        cell.bannerImage.kf.setImage(with: URL(string: model.cover!), placeholder: UIImage.init(named: "user_header_image"), options: nil, progressBlock: nil, completionHandler: nil)
        
        return cell
    }
}

extension TopBannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: __screenWidth, height: 160)
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

extension TopBannerView: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        makeInfiniteScrolling()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        makeInfiniteScrolling()
    }
    
    func makeInfiniteScrolling() {
        self.upperIndex = self.currentIndex
        self.currentIndex = self.currentIndex + 1
        self.nextIndex = self.currentIndex + 1
        if (self.currentIndex == self.imageArray.count) {
            self.currentIndex = 0
            self.upperIndex = self.imageArray.count
            self.nextIndex = 1
        }
    }
}
