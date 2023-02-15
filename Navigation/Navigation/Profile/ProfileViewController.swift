//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Наталия Куракова on 30.01.2023.
//

import UIKit

private var cellID = "PostView"
private var photosCellID = "PhotosTableViewCell"

class ProfileViewController: UIViewController {
    
    var profileHeaderView = {
        var profileHeaderView = ProfileHeaderView()
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()
    
    var photosTableViewCell = {
        var photosTableViewCell = PhotosTableViewCell()
        photosTableViewCell.translatesAutoresizingMaskIntoConstraints = false
        return photosTableViewCell
    }()

    
       
    var dataSource: [Post] = [
        Post(author: "Tom Black", description: "First time in NY!", image: "cat in NY", likes: 123, views: 456),
        Post(author: "Hipster Capybara", description: "My friend Sharik", image: "capy friend", likes: 12, views: 24),
        Post(author: "Rihanna", description: "Shine bright like a diamond, Shine bright like a diamond, Shining bright like a diamond. We're beautiful like diamonds in the sky.", image: "rihanna", likes: 147899, views: 300873),
        Post(author: "Manul Cat", description: "Hello!", image: "manul cat", likes: 115, views: 500)
        
    ]
   
    var profileTableHeaderView: ProfileTableHeaderView! = {
        let profileTableHeaderView = ProfileTableHeaderView()
        return profileTableHeaderView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
        
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileTableHeaderView)
        
        self.profileTableHeaderView.table.dataSource = self
        self.profileTableHeaderView.table.delegate = self
        
        self.profileTableHeaderView.table.register(PostView.self , forCellReuseIdentifier: cellID)
        self.profileTableHeaderView.table.register(PhotosTableViewCell.self , forCellReuseIdentifier: photosCellID)
        

        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: profileTableHeaderView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: profileTableHeaderView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: profileTableHeaderView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: profileTableHeaderView.bottomAnchor, constant: 0)
        ])
    
        

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    @objc func onTapArrowContact() {
        let photosViewController = PhotosViewController()
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }
   
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row != 0) {
            let cell = profileTableHeaderView.table.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostView
            cell.authorNameLabel.text = dataSource[indexPath.row - 1].author
            cell.descriptionLabel.text = dataSource[indexPath.row - 1].description
            cell.postImageView.image = UIImage(named: dataSource[indexPath.row - 1].image)
            cell.likesLabel.text = "Likes: \(dataSource[indexPath.row - 1].likes)"
            cell.viewsLabel.text = "Views: \(dataSource[indexPath.row - 1].views)"
            return cell
        }
        let cell = profileTableHeaderView.table.dequeueReusableCell(withIdentifier: photosCellID, for: indexPath) as! PhotosTableViewCell
        cell.onTapArrowContact = self.onTapArrowContact
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }
}

