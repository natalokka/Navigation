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
   
    var profileTableHeaderView: ProfileTableHeaderView = {
        let profileTableHeaderView = ProfileTableHeaderView()
        return profileTableHeaderView
    }()
    
    var openedAvatarView: OpenedAvatarView = {
        let openedAvatarView = OpenedAvatarView()
        return openedAvatarView
    }()
    
    var tapGestureRecogniser = UITapGestureRecognizer()
    var widthConstraint: NSLayoutConstraint!
    var heightConstraint: NSLayoutConstraint!
    var isBig = false
    
    
    @objc func handleTap(sender: UITapGestureRecognizer){
        openedAvatarView.isHidden = false
    
        for i in openedAvatarView.avatarImageView.constraints {
            i.isActive = false
        }
        
        NSLayoutConstraint.activate([
            openedAvatarView.avatarImageView.leadingAnchor.constraint(equalTo: openedAvatarView.leadingAnchor, constant: 0),
            openedAvatarView.avatarImageView.trailingAnchor.constraint(equalTo: openedAvatarView.trailingAnchor, constant: 0),
            openedAvatarView.avatarImageView.centerYAnchor.constraint(equalTo: openedAvatarView.centerYAnchor, constant: 0),
        ])
        
        UIView.animate(withDuration: 2, delay: 0, animations: self.view.layoutIfNeeded)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray6
        profileTableHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(profileTableHeaderView)
        
        view.addSubview(openedAvatarView)
        profileTableHeaderView.addSubview(profileHeaderView)
        
        self.title = "Profile"
        self.navigationController?.navigationBar.isHidden = false
        
        self.profileTableHeaderView.table.dataSource = self
        self.profileTableHeaderView.table.delegate = self
        
        self.profileTableHeaderView.table.register(PostView.self , forCellReuseIdentifier: cellID)
        self.profileTableHeaderView.table.register(PhotosTableViewCell.self , forCellReuseIdentifier: photosCellID)

        
        NSLayoutConstraint.activate([
            
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: profileTableHeaderView.trailingAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: profileTableHeaderView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: profileTableHeaderView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: profileTableHeaderView.bottomAnchor, constant: 0),
            
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: openedAvatarView.topAnchor, constant: 0),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: openedAvatarView.bottomAnchor, constant: 0),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: openedAvatarView.leadingAnchor, constant: 0),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: openedAvatarView.trailingAnchor, constant: 0),
            
            profileHeaderView.widthAnchor.constraint(equalTo: profileTableHeaderView.widthAnchor)        ])
    
        tapGestureRecogniser.addTarget(self, action: #selector(handleTap))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureRecogniser)

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
            cell.likes = dataSource[indexPath.row - 1].likes
            cell.views = dataSource[indexPath.row - 1].views
            cell.transitionToDescription = { desctiprion in
                let postDescriptioViewController = PostDescriptioViewController()
                postDescriptioViewController.postDescriptionLabel.text = desctiprion
                postDescriptioViewController.photo.image = cell.postImageView.image
                self.present(postDescriptioViewController, animated: true)
                
            }
            cell.updateLikes()
            cell.updateViews()
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

