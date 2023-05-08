//
//  OpenedAvaratView.swift
//  Navigation
//
//  Created by Наталия Куракова on 17.02.2023.
//

import UIKit


class OpenedAvatarView: UIView {
    
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
    
    var exitButton: UIButton! {
        let exitButton = UIButton(frame: .zero)
        let systemImage = UIImage(systemName: "arrow.forward") ;
        exitButton.setImage(systemImage, for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
//        exitButton.isHidden = true
        return exitButton
    }
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white.withAlphaComponent(0.5)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(avatarImageView)
        addSubview(exitButton)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
        ])
    }
}

