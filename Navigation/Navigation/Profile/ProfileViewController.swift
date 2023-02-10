//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
   
    var profileHeaderView: ProfileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        view.addSubview(profileHeaderView)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: profileHeaderView.bottomAnchor, constant: 0)
        ])
    
        

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
   
}
