//
//  OneEmptyDataProtocol.swift
//  One-Swift
//
//  Created by rp.wang on 2019/5/22.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import Lottie

enum emptyType {
    case loadingType
    case loadErrorType
    case networkType
}

protocol EmptyDataSetProtocol: UIViewController {
    func showEmptyView()
    func hiddenEmptyView()
    func showLoadingView()
    func hiddenLoadingView()
}

extension EmptyDataSetProtocol {
    func addEmptyView(type: emptyType?, iconName: String, tipTitle: String, action: Selector? = nil) {
    
        if type != .loadErrorType {
            return
        }
        
        let emptyColor: UIColor = UIColor.init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        
        let emptyView: UIView = UIView(frame: view.bounds)
        view.addSubview(emptyView)
        emptyView.tag = 1000
        
        let loadingErrorImage: UIImageView = UIImageView.init()
        view.addSubview(loadingErrorImage)
        loadingErrorImage.image = UIImage.init(named: iconName)
        loadingErrorImage.translatesAutoresizingMaskIntoConstraints = false
        loadingErrorImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        loadingErrorImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        loadingErrorImage.widthAnchor.constraint(equalToConstant: 108).isActive = true
        loadingErrorImage.heightAnchor.constraint(equalToConstant: 124).isActive = true
        
        let alertLab: UILabel = UILabel.init()
        view.addSubview(alertLab)
        alertLab.translatesAutoresizingMaskIntoConstraints = false
        alertLab.topAnchor.constraint(equalTo: loadingErrorImage.bottomAnchor, constant: 10).isActive = true
        alertLab.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        alertLab.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        alertLab.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        alertLab.text = tipTitle
        alertLab.font = UIFont.init(name: "Montserrat-SemiBold", size: 12)
        alertLab.numberOfLines = 0
        alertLab.textAlignment = .center
        alertLab.textColor = emptyColor
        
        let retryBtn: UIButton = UIButton.init()
        view.addSubview(retryBtn)
        retryBtn.translatesAutoresizingMaskIntoConstraints = false
        retryBtn.topAnchor.constraint(equalTo: alertLab.bottomAnchor, constant: 10).isActive = true
        retryBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        retryBtn.widthAnchor.constraint(equalToConstant: 88).isActive = true
        retryBtn.heightAnchor.constraint(equalToConstant: 36).isActive = true
        retryBtn.layer.cornerRadius = 18
        retryBtn.layer.borderWidth = 2
        retryBtn.layer.borderColor = emptyColor.cgColor
        retryBtn.setTitle("Retry", for: .normal)
        retryBtn.setTitleColor(emptyColor, for: .normal)
        retryBtn.addTarget(self, action: action!, for: .touchUpInside)
    }
    
    func removeEmptyView() {
        for emptyView:UIView in view.subviews {
//            if emptyView.tag == 1000 {
//                addLoadingView(type: .loadingType)
//                emptyView.removeFromSuperview()
//            }
        }
    }
}

extension EmptyDataSetProtocol {
//    func addLoadingView(type: emptyType?) {
//        if type != .loadingType {
//            return
//        }
//        let path : String = Bundle.main.path(forResource: "Refresh", ofType: "json")!;
//        let loadingAnimationView: AnimationView = AnimationView.init(filePath: path)
//        view.addSubview(loadingAnimationView)
//        loadingAnimationView.tag = 1001
//        loadingAnimationView.translatesAutoresizingMaskIntoConstraints = false
//        loadingAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
//        loadingAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
//        loadingAnimationView.widthAnchor.constraint(equalToConstant: 140).isActive = true
//        loadingAnimationView.heightAnchor.constraint(equalToConstant: 140).isActive = true
//        loadingAnimationView.contentMode = UIView.ContentMode.scaleAspectFit
//        loadingAnimationView.play()
//    }
    
    func removeLoading() {
        for loadingView:UIView in view.subviews {
            if loadingView.tag == 1001 {
                loadingView.removeFromSuperview()
            }
        }
    }
}
