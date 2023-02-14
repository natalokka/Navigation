//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

private var cellID = "PostView"

class ProfileViewController: UIViewController {
    
    struct Post {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
    }
    
    var profileHeaderView = {
        var profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
       
    var dataSource: [Post] = [
        Post(author: "Tom Black", description: "First time in NY!", image: "cat in NY", likes: 123, views: 456),
        Post(author: "Hipster Capybara", description: "My friend Sharik", image: "capy friend", likes: 12, views: 24),
        Post(author: "Rihanna", description: "Shine bright like a diamond, Shine bright like a diamond, Shining bright like a diamond. We're beautiful like diamonds in the sky.", image: "rihanna", likes: 147899, views: 300873),
        Post(author: "Manul Cat", description: "Hello!", image: "manul cat", likes: 115, views: 500)
        
    ]
   
    var profileTableHeaderView = {
        var profileTableHeaderView = ProfileTableHeaderView()
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileTableHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        view.addSubview(profileTableHeaderView)
        
        profileTableHeaderView.table.dataSource = self
        profileTableHeaderView.table.delegate = self
        profileTableHeaderView.table.register(PostView.self , forCellReuseIdentifier: cellID)
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: profileTableHeaderView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: profileTableHeaderView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: profileTableHeaderView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: profileTableHeaderView.bottomAnchor, constant: 0),
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
   
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableHeaderView.table.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostView
        cell.authorNameLabel.text = dataSource[indexPath.item].author
        cell.descriptionLabel.text = dataSource[indexPath.item].description
        cell.postImageView.image = UIImage(named: dataSource[indexPath.item].image)
        cell.likesLabel.text = "Likes: \(dataSource[indexPath.item].likes)"
        cell.viewsLabel.text = "Views: \(dataSource[indexPath.item].views)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            return profileHeaderView
        
        }
}
