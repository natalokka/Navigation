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

        view = profileHeaderView

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
   
}
