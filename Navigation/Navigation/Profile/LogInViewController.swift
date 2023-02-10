//
//  LogInViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 10.02.2023.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        //        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 2000)
        
        
        view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
        
        scrollView.keyboardDismissMode = .interactive
        
        let logoVK = UIImageView(frame: .zero)
        logoVK.image = UIImage(named: "logo")
        logoVK.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logoVK)
        
        
        
        let safeLayout = self.view.safeAreaLayoutGuide
        
        let loginTextField = UITextField(frame: .zero)
        loginTextField.backgroundColor = .systemGray6
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.placeholder = "  Email or phone"
        loginTextField.autocapitalizationType = .none
        loginTextField.isUserInteractionEnabled = true
        loginTextField.textColor = UIColor.black
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.tintColor = .systemGray6
        loginTextField.layer.borderWidth = 0.5
        loginTextField.clipsToBounds = true
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(loginTextField)
        
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.placeholder = "  Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.isUserInteractionEnabled = true
        passwordTextField.textColor = UIColor.black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.tintColor = .systemGray6
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(passwordTextField)
        
        
        let logInButton = UIButton(frame: .zero)
        logInButton.backgroundColor = UIColor(named: "My CS")
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        logInButton.titleLabel?.textColor = .white
        logInButton.addTarget(self, action: #selector(moveToProfile), for: .touchUpInside)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logInButton)
        
        
        NSLayoutConstraint.activate([
            //            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            //            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoVK.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            loginTextField.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            loginTextField.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 0),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
        
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height-self.view.safeAreaInsets.bottom+20, right: 0)
    }

    @objc func keyboardWillHide(_ notification: NSNotification){
        self.scrollView.contentInset = .zero
    }
    
    @objc private func moveToProfile(){
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
}
