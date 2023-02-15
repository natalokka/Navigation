//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 15.02.2023.
//

import Foundation
import UIKit

class PhotosViewController: UIViewController {
    
    static let reusableID = "collectionCell"
    
    var photos: [UIImage] = [
        UIImage(named: "photo 1")!,
        UIImage(named: "photo 2")!,
        UIImage(named: "photo 3")!,
        UIImage(named: "photo 4")!,
        UIImage(named: "photo 5")!,
        UIImage(named: "photo 6")!,
        UIImage(named: "photo 7")!,
        UIImage(named: "photo 8")!,
        UIImage(named: "photo 9")!,
        UIImage(named: "photo 10")!,
        UIImage(named: "photo 11")!,
        UIImage(named: "photo 12")!,
        UIImage(named: "photo 13")!,
        UIImage(named: "photo 14")!,
        UIImage(named: "photo 15")!,
        UIImage(named: "photo 16")!,
        UIImage(named: "photo 17")!,
        UIImage(named: "photo 18")!,
        UIImage(named: "photo 19")!,
        UIImage(named: "photo 20")!
    ]
    
    var photosCollectionView = {
        var photosCollectionView = PhotosCollectionView()
        return photosCollectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPink
        
        photosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        
        view.addSubview(photosCollectionView)
        
        self.photosCollectionView.dataSource = self
        self.photosCollectionView.delegate = self
        
        self.photosCollectionView.register(PhotosCollectionViewCell.self , forCellWithReuseIdentifier: PhotosViewController.reusableID)
        

        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: photosCollectionView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: photosCollectionView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: photosCollectionView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: 0)
        ])
    
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosViewController.reusableID, for: indexPath) as! PhotosCollectionViewCell
        cell.photo.image = photos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 48)/3, height: 100)
    }
}
