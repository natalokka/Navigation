//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Наталия Куракова on 15.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    typealias OnTapArrowContact = () -> Void
    var onTapArrowContact: OnTapArrowContact?
    
    var labelForTableCell: UILabel! = {
        let labelForTableCell = UILabel(frame: .zero)
        labelForTableCell.text = "Photos"
        labelForTableCell.textColor = UIColor.black
        labelForTableCell.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        labelForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return labelForTableCell
    }()
    
    var image1ForTableCell: UIImageView! = {
        let image1ForTableCell = UIImageView(frame: .zero)
        image1ForTableCell.image = UIImage(named: "photo 1")
        image1ForTableCell.layer.cornerRadius = 6
        image1ForTableCell.clipsToBounds = true
        image1ForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return image1ForTableCell
    }()
    
    var image2ForTableCell: UIImageView! = {
        let image2ForTableCell = UIImageView(frame: .zero)
        image2ForTableCell.image = UIImage(named: "photo 2")
        image2ForTableCell.layer.cornerRadius = 6
        image2ForTableCell.clipsToBounds = true
        image2ForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return image2ForTableCell
    }()
    
    var image3ForTableCell: UIImageView! = {
        var image3ForTableCell = UIImageView(frame: .zero)
        image3ForTableCell.image = UIImage(named: "photo 3")
        image3ForTableCell.layer.cornerRadius = 6
        image3ForTableCell.clipsToBounds = true
        image3ForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return image3ForTableCell
    }()
    
    var image4ForTableCell: UIImageView! = {
        var image4ForTableCell = UIImageView(frame: .zero)
        image4ForTableCell.image = UIImage(named: "photo 4")
        image4ForTableCell.layer.cornerRadius = 6
        image4ForTableCell.clipsToBounds = true
        image4ForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return image4ForTableCell
    }()
    
    var buttonForTableCell: UIButton! = {
        let buttonForTableCell = UIButton(frame: .zero)
        let systemImage = UIImage(systemName: "arrow.forward") ;
        buttonForTableCell.setImage(systemImage, for: .normal)
        buttonForTableCell.translatesAutoresizingMaskIntoConstraints = false
        return buttonForTableCell
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buttonForTableCell.addTarget(self, action: #selector(moveToGallery), for: .touchUpInside)
        buttonForTableCell.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        contentView.isUserInteractionEnabled = true
        addSubviewsForPhotosTableViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviewsForPhotosTableViewCell() {
        addSubview(labelForTableCell)
        addSubview(image1ForTableCell)
        addSubview(image2ForTableCell)
        addSubview(image3ForTableCell)
        addSubview(image4ForTableCell)
        addSubview(buttonForTableCell)
        constraintsForPhotosTableViewCell()
    }
    
    func constraintsForPhotosTableViewCell(){
        NSLayoutConstraint.activate([
            labelForTableCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            labelForTableCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            buttonForTableCell.centerYAnchor.constraint(equalTo: labelForTableCell.centerYAnchor),
            buttonForTableCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            image1ForTableCell.topAnchor.constraint(equalTo: labelForTableCell.bottomAnchor, constant: 12),
            image1ForTableCell.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: -12),
            image1ForTableCell.heightAnchor.constraint(equalTo: image1ForTableCell.widthAnchor),
            image1ForTableCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            image1ForTableCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            image2ForTableCell.centerYAnchor.constraint(equalTo: image1ForTableCell.centerYAnchor),
            image2ForTableCell.leadingAnchor.constraint(equalTo: image1ForTableCell.trailingAnchor, constant: 8),
            image2ForTableCell.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: -12),
            image2ForTableCell.heightAnchor.constraint(equalTo: image2ForTableCell.widthAnchor),
            image3ForTableCell.centerYAnchor.constraint(equalTo: image1ForTableCell.centerYAnchor),
            image3ForTableCell.leadingAnchor.constraint(equalTo: image2ForTableCell.trailingAnchor, constant: 8),
            image3ForTableCell.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: -12),
            image3ForTableCell.heightAnchor.constraint(equalTo: image3ForTableCell.widthAnchor),
            image4ForTableCell.centerYAnchor.constraint(equalTo: image1ForTableCell.centerYAnchor),
            image4ForTableCell.leadingAnchor.constraint(equalTo: image3ForTableCell.trailingAnchor, constant: 8),
            image4ForTableCell.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25, constant: -12),
            image4ForTableCell.heightAnchor.constraint(equalTo: image4ForTableCell.widthAnchor),
            
        ])
    }
    
    @objc private func moveToGallery() {
        if (self.onTapArrowContact != nil) {
            onTapArrowContact!()
        }
    }
}
