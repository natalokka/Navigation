//
//  AvatarImageView.swift
//  Navigation
//
//  Created by Наталия Куракова on 08.02.2023.
//

import UIKit

class AvatarImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        image = UIImage(named: "capy")
        layer.cornerRadius = 55
        layer.masksToBounds = true
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 3
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
