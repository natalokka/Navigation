//
//  PostViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 31.12.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = "Anonymous"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
        self.navigationItem.title = titlePost
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(changeView))
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func changeView() {
        self.present(createInfoViewController() , animated: true)
    }
    
    func createInfoViewController() -> UIViewController {
        let infoViewController = InfoViewController()
        return infoViewController
    }
}
