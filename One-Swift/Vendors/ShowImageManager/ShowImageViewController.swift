//
//  ShowImageViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/21.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {
    weak var delegate : ShowImageProtocol?
    var collectionView: UICollectionView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        configCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func configCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        self.collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        self.view.addSubview(self.collectionView!)
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView?.backgroundColor = UIColor.black
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        self.collectionView?.register(ShowImageCollectionViewCell.self, forCellWithReuseIdentifier: "ShowImageCollectionViewCellID")
        self.collectionView?.backgroundColor = UIColor.black
    }
   
}

extension ShowImageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.dismiss(animated: true) {
            
        }
    }
}

extension ShowImageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShowImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShowImageCollectionViewCellID", for: indexPath) as! ShowImageCollectionViewCell
       

        return cell
    }
}

extension ShowImageViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: __screenWidth, height: __screenHeight)
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

extension ShowImageViewController: UIViewControllerTransitioningDelegate {
   
    override func loadView() {
        super.loadView()
        self.transitioningDelegate = self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImagesShowPresentAnimation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ImageDissmissAnimation()
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ImageShowPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
    
}


