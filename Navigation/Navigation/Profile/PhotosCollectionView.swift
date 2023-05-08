//
//  PhotosCollectionView.swift
//  Navigation
//
//  Created by Наталия Куракова on 15.02.2023.
//

import Foundation
import UIKit

class PhotosCollectionView: UICollectionView {
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
