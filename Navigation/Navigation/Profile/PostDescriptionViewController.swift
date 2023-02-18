//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 18.02.2023.
//

import UIKit

class PostDescriptioViewController: UIViewController {
    
    let postDescriptionLabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.backgroundColor = .white
        postDescriptionLabel.textAlignment = .natural
        return postDescriptionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemPink
        view = postDescriptionLabel
    }
    
}
