//
//  FullNameLabel.swift
//  Navigation
//
//  Created by Наталия Куракова on 08.02.2023.
//

import UIKit

class FullNameLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        text = "Hipster Capybara"
        backgroundColor = UIColor.orange
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
