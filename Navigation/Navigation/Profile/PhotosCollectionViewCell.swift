//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Наталия Куракова on 15.02.2023.
//

import Foundation
import UIKit
class PhotosCollectionViewCell: UICollectionViewCell {
    
    var photo: UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = UIColor.brown
        photo = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
