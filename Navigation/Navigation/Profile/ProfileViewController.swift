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
        view = UIView()
        
//        self.view.safeAreaInsetsDidChange()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
        
        let safeAreaTop = window?.safeAreaInsets.top ?? 0
        let safeAreaLeft = window?.safeAreaInsets.left ?? 0
        let safeAreaRight = window?.safeAreaInsets.right ?? 0
        let safeAreaBottom = window?.safeAreaInsets.bottom ?? 0
        
        view.frame = CGRect(x: safeAreaLeft, y: safeAreaTop, width: view.frame.width - safeAreaRight, height: view.frame.height - safeAreaBottom)
        view.backgroundColor = .lightGray
        
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }
   
}
