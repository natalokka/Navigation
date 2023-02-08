//
//  StatusTextField.swift
//  Navigation
//
//  Created by Наталия Куракова on 08.02.2023.
//

import UIKit

class StatusTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        placeholder = "Waiting for something..."
        isUserInteractionEnabled = true
        backgroundColor = UIColor.orange
        textColor = UIColor.black
        font = UIFont.systemFont(ofSize: 14, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
