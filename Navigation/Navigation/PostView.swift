//
//  Post.swift
//  Navigation
//
//  Created by Наталия Куракова on 17.01.2023.
//


import UIKit

class PostView: UITableViewCell {
    
    let descriptionTapGestureRecogniser = UITapGestureRecognizer()
    
    var transitionToDescription: (String) -> () = {_ in }
    
    var likes = 0
    
    var authorNameLabel: UILabel! = {
        let authorNameLabel = UILabel(frame: .zero)
        authorNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorNameLabel.numberOfLines = 2
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorNameLabel
    }()
    
    var descriptionLabel: UILabel! = {
        let descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.textColor = UIColor.lightGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    var likesButton = {
        var likesButton = UIButton()
        likesButton.setTitleColor(.black, for: .normal)
        likesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        likesButton.titleLabel?.textColor = .black
        likesButton.isUserInteractionEnabled = true
        likesButton.addTarget(self, action: #selector(onPressLikeButton), for: .touchUpInside)
        
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        return likesButton
    }()
    
    @objc func onPressLikeButton() {
        likes += 1
        updateLikes()
    }
    
    var postImageView: UIImageView! = {
        let postImageView = UIImageView(frame: .zero)
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = UIColor.black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    func updateLikes() {
        likesButton.setTitle("Likes: \(likes)", for: .normal)
    }
    
    @objc func onLikeTouch(){
        likes += 1
    }
    
    var viewsLabel: UILabel! = {
        let viewsLabel = UILabel(frame: .zero)
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        descriptionTapGestureRecogniser.addTarget(self, action: #selector(tapForDescription))
        addGestureRecognizer(descriptionTapGestureRecogniser)
        addSubViewsAndlayout()
    }
    
    @objc func tapOnLike() {
        
        likes += 1
        updateLikes()
    }
    
    @objc func tapForDescription() {
        transitionToDescription(descriptionLabel.text ?? "")
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViewsAndlayout() {
        contentView.addSubview(authorNameLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(likesButton)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(descriptionLabel)
        
        constraintsForPost()
    }
    
    func constraintsForPost() {
        NSLayoutConstraint.activate([
            authorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 12),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            likesButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
