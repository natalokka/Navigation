//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var didSetupConstraints = false
    
    private var avatarImageView: UIImageView = UIImageView(frame: .zero)
    
    
    private var fullNameLabel: UILabel = UILabel(frame: .zero)
    
    private var statusTextField: UITextField = UITextField(frame: .zero)
        
    
    private var setStatusButton: UIButton = UIButton(frame: .zero)
        
    private var newButton: UIButton = UIButton(frame: .zero)
    
    @objc func buttonAction3() {
//          let text = setStatusButton.text ?? "no text"
//          print(text)
        print("no text")
    }
        
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.orange
        clipsToBounds = true
        
        addSubview(avatarImageView)
        avatarImageView.image = UIImage(named: "capy")
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 3
        self.avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(fullNameLabel)
        fullNameLabel.text = "Hipster Capybara"
        fullNameLabel.backgroundColor = UIColor.orange
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //        addSubview(self.statusLabel)
        addSubview(statusTextField)
        
        statusTextField.placeholder = "Waiting for something..."
        statusTextField.isUserInteractionEnabled = true
        statusTextField.backgroundColor = UIColor.orange
        statusTextField.textColor = UIColor.black
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.statusTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(setStatusButton)
        
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        setStatusButton.titleLabel?.textColor = .white
//        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        setStatusButton.layer.shadowRadius = CGFloat(4)
//        setStatusButton.layer.shadowColor = UIColor.black.cgColor
//        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        self.setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(newButton)
        
        newButton.backgroundColor = .white
        newButton.layer.cornerRadius = 4
        newButton.setTitle("Show meme", for: .normal)
        newButton.setTitleColor(.black, for: .normal)
        newButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        newButton.titleLabel?.textColor = .white
//        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
//        setStatusButton.layer.shadowRadius = CGFloat(4)
//        setStatusButton.layer.shadowColor = UIColor.black.cgColor
//        setStatusButton.layer.shadowOpacity = 0.7
        newButton.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        self.newButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.setNeedsUpdateConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if didSetupConstraints == false {
            addConstraintsForMyLabel()
        }
        super.updateConstraints()
    }
    
    private func addConstraintsForMyLabel() {
        let mySuperview = self.superview
        if (mySuperview != nil) {
            NSLayoutConstraint.activate([
                mySuperview!.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                mySuperview!.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                mySuperview!.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
                mySuperview!.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                self.heightAnchor.constraint(equalToConstant: 220),
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
                newButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                newButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                newButton.heightAnchor.constraint(equalToConstant: 50),
                newButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
        }
    }
    
}
