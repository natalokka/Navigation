//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 18.02.2023.
//

import UIKit

class PostDescriptioViewController: UIViewController {
    
    let postDescriptionLabel = {
        let postDescriptionLabel = UILabel(frame: .zero)
        postDescriptionLabel.backgroundColor = .white
        postDescriptionLabel.textAlignment = .natural
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postDescriptionLabel
    }()
    
    let photo = {
        let photo = UIImageView(frame: .zero)
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(postDescriptionLabel)
        view.addSubview(photo)
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: photo.topAnchor),
            view.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: photo.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: postDescriptionLabel.topAnchor),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: photo.trailingAnchor)
        ])
    }
    
}
