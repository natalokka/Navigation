//
//  PhotosFullScreenView.swift
//  Navigation
//
//  Created by Наталия Куракова on 18.02.2023.
//

import UIKit

class PhotosFullScreenView: UIView {
    
    var oldCell: PhotosCollectionViewCell? = nil
    var oldConstraints: [NSLayoutConstraint] = []
    var onPressedExitAction: (PhotosCollectionViewCell) -> () = {_ in }
    
    var placeForPhoto = {
        var placeForPhoto = UIView(frame: .zero)
        placeForPhoto.translatesAutoresizingMaskIntoConstraints = false
        return placeForPhoto
    }()
    
    var photo: UIImageView = UIImageView()
    
    var buttonToExit = {
        var buttonToExit = UIButton(frame: .zero)
        buttonToExit.isUserInteractionEnabled = true
        buttonToExit.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        buttonToExit.addTarget(self, action: #selector(onPressExitButton), for: .touchUpInside)
        buttonToExit.translatesAutoresizingMaskIntoConstraints = false
        return buttonToExit
    }()
    
    @objc func onPressExitButton() {        
        onPressedExitAction(oldCell!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        
//        backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.1)
        
        addSubview(placeForPhoto)
        addSubview(photo)
        addSubview(buttonToExit)
        
        NSLayoutConstraint.activate([
            buttonToExit.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            buttonToExit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            buttonToExit.widthAnchor.constraint(equalToConstant: 30),
            buttonToExit.heightAnchor.constraint(equalToConstant: 30),
            placeForPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            placeForPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            placeForPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            placeForPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
