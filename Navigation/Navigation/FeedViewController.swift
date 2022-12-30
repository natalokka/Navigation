//
//  FeedViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.12.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
    private lazy var button: UIButton = {
           let button = UIButton()
           button.backgroundColor = .blue
           button.layer.cornerRadius = 12
           button.setTitle("Перейти на пост", for: .normal)
           button.setTitleColor(.lightGray, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
//           button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
}
