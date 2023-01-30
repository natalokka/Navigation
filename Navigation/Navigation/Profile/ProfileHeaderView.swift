//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private var photo: UIImageView {
        let photo = UIImageView()
        photo.image = UIImage(named: "capy")
        photo.frame = CGRect(x: 16, y: 16, width: 100, height: 100)
        photo.layer.cornerRadius = 50
        photo.layer.masksToBounds = true
        photo.layer.borderColor = UIColor.black.cgColor
        photo.layer.borderWidth = 3
        return photo
    }
    
    private var text1: UITextView {
        let text1 = UITextView()
    
        text1.frame = CGRect(x: 125, y: 27, width: 200, height: 30)
        text1.text = "Hipster Capybara"
        text1.backgroundColor = UIColor.lightGray
        text1.textColor = UIColor.black
        text1.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return text1
    }
   
    private var text2: UITextField {
        let text2 = UITextField()
        
        
        text2.frame = CGRect(x: text1.frame.origin.x, y: buttonShowStatus.frame.origin.y - 64, width: 300, height: 30)
        text2.placeholder = "Waiting for something..."
        text2.isUserInteractionEnabled = true
        text2.backgroundColor = UIColor.lightGray
        text2.textColor = UIColor.black
        text2.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return text2
    }
   
    private var buttonShowStatus: UIButton = {
        let buttonShowStatus = UIButton()
        buttonShowStatus.frame = CGRect(x: 16, y: 132, width: 359, height: 50)
        buttonShowStatus.backgroundColor = .blue
        buttonShowStatus.layer.cornerRadius = 4
        buttonShowStatus.setTitle("Show status", for: .normal)
        buttonShowStatus.setTitleColor(.white, for: .normal)
        buttonShowStatus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        buttonShowStatus.titleLabel?.textColor = .white
        buttonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonShowStatus.layer.shadowRadius = CGFloat(4)
        buttonShowStatus.layer.shadowColor = UIColor.black.cgColor
        buttonShowStatus.layer.shadowOpacity = 0.7
        buttonShowStatus.addTarget(self, action: #selector(buttonAction3), for: .touchUpInside)
        return buttonShowStatus
    }()
    
    @objc func buttonAction3() {
        let text = text2.text ?? "no text"
        print(text)
        }
    
    private func setupLayout() {
        addSubview(self.photo)
        addSubview(self.text1)
        addSubview(self.text2)
        addSubview(self.buttonShowStatus)
    }
    
    private func setupViews(){
        text2.center = text1.center    }
}
