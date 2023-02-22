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
        return photo
    }()

    
    private func updatePhotoFrame() {
        photo.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.brown
        
        addSubview(photo)
        
        updatePhotoFrame()
    }
    
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
