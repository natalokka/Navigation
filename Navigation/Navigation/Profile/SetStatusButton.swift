//
//  SetStatusButton.swift
//  Navigation
//
//  Created by Наталия Куракова on 08.02.2023.
//

import UIKit

class SetStatusButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .blue
        layer.cornerRadius = 4
        setTitle("Show status", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel?.textColor = .white
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
