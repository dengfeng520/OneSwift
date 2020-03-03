//
//  BannerDetailsViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/10.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit
import WebKit

class BannerDetailsViewController: UIViewController {

    var webURL: String!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configUI()
    }
    
    func configUI() {
        webView = WKWebView.init()
        view.addSubview(webView)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        webView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        let url: URL = URL.init(string: webURL)!
        webView.load(URLRequest.init(url: url))
    }
    
}

// MARK: - WKNavigationDelegate
extension BannerDetailsViewController: WKNavigationDelegate {
    
}

// MARK: - WKUIDelegate
extension BannerDetailsViewController: WKUIDelegate {
    
}


