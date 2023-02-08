//
//  ShowMemeButton.swift
//  Navigation
//
//  Created by Наталия Куракова on 08.02.2023.
//

import UIKit

class ShowMemeButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 4
        setTitle("Show meme", for: .normal)
        setTitleColor(.black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel?.textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
