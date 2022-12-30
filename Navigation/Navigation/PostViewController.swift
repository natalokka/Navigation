//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 31.12.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.navigationItem.title = "Пост"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
