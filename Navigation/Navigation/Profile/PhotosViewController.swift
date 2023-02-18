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
    
    var fullScreen: PhotosFullScreenView = {
        var fullScreen = PhotosFullScreenView(frame: .zero)
        return fullScreen
    }()
    
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
        view.addSubview(fullScreen)
        
        self.photosCollectionView.dataSource = self
        self.photosCollectionView.delegate = self
        
        self.photosCollectionView.register(PhotosCollectionViewCell.self , forCellWithReuseIdentifier: PhotosViewController.reusableID)
        

        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: photosCollectionView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: photosCollectionView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: photosCollectionView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: photosCollectionView.bottomAnchor, constant: 0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: fullScreen.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: fullScreen.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: fullScreen.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: fullScreen.bottomAnchor, constant: 0)
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
        cell.tapOnPhoto = { image in
            self.animate(cell: cell)
        }
        cell.openedPhoto.photo.image = photos[indexPath.item].copy() as! UIImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 48)/3, height: 100)
    }
    
    
    func animate(cell: PhotosCollectionViewCell){

        fullScreen.oldConstraints = cell.photo.constraints
        
        for i in cell.photo.constraints {
            i.isActive = false
        }
        
        cell.photo.removeConstraints(cell.photo.constraints)
        
        
        fullScreen.isHidden = false
        fullScreen.oldCell = cell
        fullScreen.onPressedExitAction = { cell in
            self.animateBack(cell: cell)
        }
        photosCollectionView.bringSubviewToFront(cell)

        NSLayoutConstraint.activate([
            cell.photo.leadingAnchor.constraint(equalTo: fullScreen.placeForPhoto.leadingAnchor, constant: 0),
            cell.photo.trailingAnchor.constraint(equalTo: fullScreen.placeForPhoto.trailingAnchor, constant: 0),
            cell.photo.topAnchor.constraint(equalTo: fullScreen.placeForPhoto.topAnchor, constant: 0),
            cell.photo.bottomAnchor.constraint(equalTo: fullScreen.placeForPhoto.bottomAnchor, constant: 0),
        ])
        

        UIView.animate(withDuration: 2, delay: 0, animations: self.view.layoutIfNeeded)
    }
    
    func animateBack(cell: PhotosCollectionViewCell){
        fullScreen.isHidden = true
        
        NSLayoutConstraint.activate([
            cell.photo.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0),
            cell.photo.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 0),
            cell.photo.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
            cell.photo.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0),
        ])

        UIView.animate(withDuration: 2, delay: 0, animations: self.view.layoutIfNeeded)
    }
    
    
    
//    func animate(cell: PhotosCollectionViewCell) {
//
//        UIView.animateKeyframes(withDuration: 1, delay: 0) {
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.5) {
//                self.view.addSubview(cell.openedPhoto)
//                cell.openedPhoto.isHidden = false
//            }
//            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.5) {
//                cell.openedPhoto.photo.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            }
//        }
//    }
}
