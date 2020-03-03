//
//  LoginViewController.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/25.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var presenter: MePresenter<LoginViewController>!
    var userNameTxt: UITextField!
    var passwordTxt: UITextField!
    var bottomView: UIView!
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Login"
        self.view.backgroundColor = UIColor.init(red: 116/255, green: 66/255, blue: 255/255, alpha: 1)
        
        self.presenter = MePresenter<LoginViewController>.init()
        self.presenter.bindDataFromServer(view: self)
        configUI()
    }
    
    func configUI() {
        
        let backImg = UIImageView.init()
        self.view.addSubview(backImg)
        backImg.translatesAutoresizingMaskIntoConstraints = false
        backImg.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15).isActive = true
        if #available(iOS 11.0, *) {
            backImg.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        } else {
            backImg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 28).isActive = true
        }
        backImg.widthAnchor.constraint(equalToConstant: 12).isActive = true
        backImg.heightAnchor.constraint(equalToConstant: 18).isActive = true
        backImg.image = UIImage.init(named: "white_back")
        let backBtn = UIButton.init()
        self.view.addSubview(backBtn)
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 5).isActive = true
        backBtn.topAnchor.constraint(equalTo: backImg.topAnchor, constant: -10).isActive = true
        backBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backBtn.addTarget(self, action: #selector(clickBackBtn), for: .touchUpInside)
        
        
        let logoImg = UIImageView.init()
        self.view.addSubview(logoImg)
        logoImg.translatesAutoresizingMaskIntoConstraints = false
        logoImg.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        if #available(iOS 11.0, *) {
            logoImg.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        } else {
             logoImg.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 32).isActive = true
        }
        logoImg.widthAnchor.constraint(equalToConstant: 135).isActive = true
        logoImg.heightAnchor.constraint(equalToConstant: 142).isActive = true
        logoImg.image = UIImage.init(named: "launch_logo")
        
        
        self.bottomView = UIView.init()
        self.view.addSubview(self.bottomView)
        self.bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.bottomView.topAnchor.constraint(equalTo: logoImg.bottomAnchor, constant: -15).isActive = true
        self.bottomView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        self.bottomView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60).isActive = true
        self.bottomView.layer.cornerRadius = 16
        self.bottomView.backgroundColor = UIColor.white
        
        
        self.userNameTxt = UITextField.init()
        self.bottomView.addSubview(self.userNameTxt)
        self.userNameTxt.translatesAutoresizingMaskIntoConstraints = false
        self.userNameTxt.topAnchor.constraint(equalTo: self.bottomView.topAnchor, constant: 60).isActive = true
        self.userNameTxt.leftAnchor.constraint(equalTo: self.bottomView.leftAnchor, constant: 35).isActive = true
        self.userNameTxt.rightAnchor.constraint(equalTo: self.bottomView.rightAnchor, constant: -35).isActive = true
        self.userNameTxt.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.userNameTxt.backgroundColor = UIColor.groupTableViewBackground
        self.userNameTxt.layer.cornerRadius = 5
        self.userNameTxt.placeholder = "userName"
        self.userNameTxt.textAlignment = .center
        self.userNameTxt.clearButtonMode = .always
        self.userNameTxt.keyboardType = .numberPad
        
        
        self.passwordTxt = UITextField.init()
        self.bottomView.addSubview(self.passwordTxt)
        self.passwordTxt.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTxt.topAnchor.constraint(equalTo: self.userNameTxt.bottomAnchor, constant: 20).isActive = true
        self.passwordTxt.leftAnchor.constraint(equalTo: self.bottomView.leftAnchor, constant: 35).isActive = true
        self.passwordTxt.rightAnchor.constraint(equalTo: self.bottomView.rightAnchor, constant: -35).isActive = true
        self.passwordTxt.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.passwordTxt.backgroundColor = UIColor.groupTableViewBackground
        self.passwordTxt.layer.cornerRadius = 5
        self.passwordTxt.placeholder = "password"
        self.passwordTxt.textAlignment = .center
        self.passwordTxt.clearButtonMode = .always
        
        
        self.loginBtn = UIButton.init()
        self.bottomView.addSubview(self.loginBtn)
        self.loginBtn.translatesAutoresizingMaskIntoConstraints = false
        self.loginBtn.topAnchor.constraint(equalTo: self.passwordTxt.bottomAnchor, constant: 30).isActive = true
        self.loginBtn.leftAnchor.constraint(equalTo: self.bottomView.leftAnchor, constant: 35).isActive = true
        self.loginBtn.rightAnchor.constraint(equalTo: self.bottomView.rightAnchor, constant: -35).isActive = true
        self.loginBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.loginBtn.backgroundColor = UIColor.init(red: 252/255, green: 221/255, blue: 53/255, alpha: 1)
        self.loginBtn.layer.masksToBounds = true
        self.loginBtn.layer.cornerRadius = 22.5
        self.loginBtn.addTarget(self, action: #selector(clickLoginBtn), for: .touchUpInside)
        self.loginBtn.setTitle("Login", for: .normal)
        self.loginBtn.setTitleColor(UIColor.black, for: .normal)
        self.loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
   
    @objc func clickBackBtn() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func clickLoginBtn() {
        var postData = Dictionary<String, Any>()
        postData.updateValue("86-18192398768", forKey: "phone")
        postData.updateValue("123456", forKey: "password")
        postData.updateValue("1", forKey: "login_type")
        self.presenter.loginFromServer(postData: postData as Dictionary<String, Any>)
    }
    
}

extension LoginViewController: MeProtocol {
    func userLoginSeccuss(model: UserModel) {
        let useModel = UserModel().convertUserModel()
        print("userID===================\(String(describing: useModel?.userId))")
//        self.dismiss(animated: true, completion: nil)

    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(false)
    }
}
