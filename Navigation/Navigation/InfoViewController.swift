//
//  InfoViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 17.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupButton()
        buttonAction2()
    }
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 15
        button.setTitle("Delete post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private func setupButton() {
        self.view.addSubview(self.button)
        self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -200).isActive = true
        self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc private func buttonAction2() {
        let uIAlertController = UIAlertController(title: "Внимание", message: "Вы точно хотите удалить пост?", preferredStyle: .alert)
        let uIAlertAction1 = UIAlertAction(title: "Yes", style: .cancel)
        let uIAlertAction2 = UIAlertAction(title: "No", style: .destructive)
        uIAlertController.addAction(uIAlertAction1)
        uIAlertController.addAction(uIAlertAction2)
        present(uIAlertController, animated: true)
        }
}
