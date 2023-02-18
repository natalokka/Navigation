//
//  PhotosOpenrfImageVire.swift
//  Navigation
//
//  Created by Наталия Куракова on 18.02.2023.
//

import UIKit

class PhotosOpenedImageView: UIView {
    
    var photo: UIImageView = {
        var photo = UIImageView()
        return photo
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.5)
        addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
