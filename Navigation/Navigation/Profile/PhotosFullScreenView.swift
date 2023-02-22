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
        
        addSubview(placeForPhoto)
        addSubview(photo)
        addSubview(buttonToExit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
