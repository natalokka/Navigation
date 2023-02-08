//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var didSetupConstraints = false
    
    private var avatarImageView = AvatarImageView()
    
    private var fullNameLabel = FullNameLabel()
    
    private var statusTextField = StatusTextField()
        
    private var setStatusButton = SetStatusButton()
        
    private var showMemeButton = ShowMemeButton()
        
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
        addSubview(showMemeButton)
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
                showMemeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                showMemeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                showMemeButton.heightAnchor.constraint(equalToConstant: 50),
                showMemeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ])
        }
    }
    
}
