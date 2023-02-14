//
//  Post.swift
//  Navigation
//
//  Created by Наталия Куракова on 17.01.2023.
//


import UIKit

class PostView: UITableViewCell {
    
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
    
   
    
    var postImageView: UIImageView! = {
        let postImageView = UIImageView(frame: .zero)
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = UIColor.black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()
    
    var likesLabel: UILabel! = {
        let likesLabel = UILabel(frame: .zero)
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    var viewsLabel: UILabel! = {
        let viewsLabel = UILabel(frame: .zero)
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndlayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViewsAndlayout() {
        addSubview(authorNameLabel)
        addSubview(postImageView)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        addSubview(descriptionLabel)
        
        constraintsForPost()
    }
    
    func constraintsForPost() {
        NSLayoutConstraint.activate([
            authorNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            authorNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            authorNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            postImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
            postImageView.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor, constant: 12),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
