//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Наталия Куракова on 15.02.2023.
//

import Foundation
import UIKit
class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImageView = {
        var photo = UIImageView(frame: .zero)
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var openedPhoto: PhotosOpenedImageView = {
        
        var openedPhoto = PhotosOpenedImageView(frame: .zero)
        openedPhoto.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        openedPhoto.isHidden = true
        return openedPhoto
    }()
    
    var tapOnPhoto: (UIImage) -> () = {_ in }
    
    var tapGestureRecogniser = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = UIColor.brown
//        photo = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        
        
        tapGestureRecogniser.addTarget(self, action: #selector(handleTap))
        addGestureRecognizer(tapGestureRecogniser)
        
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(photo)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        
//        openedPhoto.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: frame.width, height: frame.height)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        tapOnPhoto(photo.image!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
