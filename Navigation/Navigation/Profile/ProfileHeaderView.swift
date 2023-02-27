//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var didSetupConstraints = false
    
     var avatarImageView = {
        let avatarImageView =  UIImageView()
        avatarImageView.image = UIImage(named: "capy")
        avatarImageView.layer.cornerRadius = 55
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    
        return avatarImageView
    }()
    
    private var fullNameLabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Hipster Capybara"
        fullNameLabel.backgroundColor = UIColor.systemGray6
        fullNameLabel.textColor = UIColor.black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()
    
    private var statusTextField = {
        let statusTextField = UITextField()
        statusTextField.placeholder = " Set your status..."
        statusTextField.isUserInteractionEnabled = true
        statusTextField.backgroundColor = UIColor.white
        statusTextField.textColor = UIColor.black
        statusTextField.layer.masksToBounds = true
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 8
        statusTextField.layer.borderWidth = 1
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()
    
    private var statusLabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Waiting for something..."
        statusLabel.textAlignment = .left
        statusLabel.textColor = UIColor.gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel
    }()
        
    var setStatusButton = {
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
        
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.systemGray6
        clipsToBounds = true
        

        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        setStatusButton.addTarget(self, action: #selector(onPressSetStatusButton), for: .touchUpInside)
        setNeedsUpdateConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onPressSetStatusButton() {
        statusLabel.textAlignment = .left
        statusLabel.text = statusTextField.text
    }
    
    override func updateConstraints() {
        if didSetupConstraints == false {
            addConstraintsForMyLabel()
        }
        super.updateConstraints()
    }
    
    private func addConstraintsForMyLabel() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo:
                self.bottomAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -14),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: 0),
            statusTextField.heightAnchor.constraint(equalToConstant: 30),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -5),
            statusLabel.trailingAnchor.constraint(equalTo: statusTextField.trailingAnchor, constant: 0),
            statusLabel.leadingAnchor.constraint(equalTo: statusTextField.leadingAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 20),
        ])
    }
    
}
