//
//  ArticleDetailsViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/18.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailsViewController: UIViewController {

    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configUI()
         
        
    }
    
    deinit {
        print("=====================deinit")
    }
    
    func configUI() {
        webView = WKWebView.init()
        view.addSubview(webView)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        webView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        webView.backgroundColor = UIColor.white

    }
}

extension ArticleDetailsViewController: WKUIDelegate {
    
}

extension ArticleDetailsViewController: WKNavigationDelegate {
    
}
