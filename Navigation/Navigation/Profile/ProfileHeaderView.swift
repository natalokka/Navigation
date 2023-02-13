//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var didSetupConstraints = false
    
    private var avatarImageView = {
        let avatarImageView =  UIImageView()
        avatarImageView.image = UIImage(named: "capy")
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private var fullNameLabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Capybara"
        fullNameLabel.backgroundColor = UIColor.orange
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private var statusTextField = {
        let statusTextField = UITextField()
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.isUserInteractionEnabled = true
        statusTextField.backgroundColor = UIColor.orange
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
        
    private var setStatusButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        setStatusButton.titleLabel?.textColor = .white
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()
        
//    private var showMemeButton = {
//        let showMemeButton = UIButton()
//        showMemeButton.backgroundColor = .white
//        showMemeButton.layer.cornerRadius = 4
//        showMemeButton.setTitle("Show meme", for: .normal)
//        showMemeButton.setTitleColor(.black, for: .normal)
//        showMemeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
//        showMemeButton.titleLabel?.textColor = .white
//        showMemeButton.translatesAutoresizingMaskIntoConstraints = false
//        return showMemeButton
//    }()
        
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.orange
        clipsToBounds = true
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        setStatusButton.addTarget(self, action: #selector(onPressSetStatusButton), for: .touchUpInside)
//        addSubview(showMemeButton)
        setNeedsUpdateConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onPressSetStatusButton() {
        print(statusTextField.text)
    }
    
    override func updateConstraints() {
        if didSetupConstraints == false {
            addConstraintsForMyLabel()
        }
        super.updateConstraints()
    }
    
    private func addConstraintsForMyLabel() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 210),
            self.widthAnchor.constraint(equalToConstant: 395),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 20),
//            showMemeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            showMemeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            showMemeButton.heightAnchor.constraint(equalToConstant: 50),
//            showMemeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
}
