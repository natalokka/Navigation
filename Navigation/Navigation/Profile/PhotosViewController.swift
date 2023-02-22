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
    
    var currentSelectedCell: UICollectionViewCell?
    var currentCellPreviousFrame: CGRect?
    var selected = false
    
    var fullScreen: PhotosFullScreenView = {
        var fullScreen = PhotosFullScreenView(frame: .zero)
        return fullScreen
    }()
    
    var button: UIButton = UIButton()
    
    @objc func buttonTapped() {
        guard let currentCellPreviousFrame else { return }
        UIView.animate(withDuration: 0.25, delay: 0, animations: {
            if self.currentSelectedCell != nil {
                (self.currentSelectedCell as! PhotosCollectionViewCell).frame = currentCellPreviousFrame
                (self.currentSelectedCell as! PhotosCollectionViewCell).photo.frame = CGRect(origin: .zero, size: currentCellPreviousFrame.size)
            }
            self.view.layoutSubviews()
        })
        self.selected = false
    }
    
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
        
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        
        view.addSubview(photosCollectionView)
        view.addSubview(button)
        
        self.photosCollectionView.dataSource = self
        self.photosCollectionView.delegate = self
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.photosCollectionView.register(PhotosCollectionViewCell.self , forCellWithReuseIdentifier: PhotosViewController.reusableID)
        self.photosCollectionView.frame = view.frame
        self.photosCollectionView.reloadData()
        button.frame = CGRect(origin: CGPoint(x: 320, y: 100), size: CGSize(width: 50, height: 50))
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let systemImage = UIImage(systemName: "arrow.backward") ;
        button.setImage(systemImage, for: .normal)
        view.bringSubviewToFront(button)
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosViewController.reusableID, for: indexPath) as! PhotosCollectionViewCell
        
        cell.photo.image = photos[indexPath.item]
        return cell
    }
}
    
extension PhotosViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selected {
            return
        }
        let cell = collectionView.cellForItem(at: indexPath)
        currentSelectedCell = cell
        currentCellPreviousFrame = cell?.frame
        UIView.animate(withDuration: 0.25, delay: 0, animations: {
            if cell != nil {
                cell!.frame = self.view.frame
                (cell as! PhotosCollectionViewCell).photo.frame = self.view.frame
                self.photosCollectionView.bringSubviewToFront(cell!)
                self.selected = true
            }
            self.view.layoutSubviews()
        })
    }
}
    
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 48)/3, height: 100)
    }
}
