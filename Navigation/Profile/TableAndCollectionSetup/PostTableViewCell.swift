//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/23/23.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var likesTapAction: (() -> Void)?
    
    private let authorOfPost: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let postDescription: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorOfPost.text = nil
        postImageView.image = nil
        postDescription.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    @objc func labelTapped() {
        likesTapAction?()
    }
    
    func setupCell(post: PostForProfile) {
        authorOfPost.text = post.author
        postImageView.image = post.image
        postDescription.text = post.description
        likesLabel.text = "Likes: \(String(post.likes))"
        viewsLabel.text = "Views: \(String(post.views))"
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        likesLabel.isUserInteractionEnabled = true
        likesLabel.addGestureRecognizer(tapGesture)
    }
    
    private func layout() {
        [authorOfPost, postImageView, postDescription, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // authorOfPost
            authorOfPost.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metric.viewInset),
            authorOfPost.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            authorOfPost.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            
            // postImageView
            postImageView.topAnchor.constraint(equalTo: authorOfPost.bottomAnchor, constant: Metric.viewInset),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: Metric.screenWidth),
            
            // postDescription
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Metric.viewInset),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            
            // likesLabel
            likesLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.viewInset),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.viewInset),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Metric.viewInset),
            
            // viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metric.viewInset),
            viewsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor)
        ])
    }
}

extension PostTableViewCell {
    enum Metric {
        static let viewInset: CGFloat = 16
        static let screenRect = UIScreen.main.bounds
        static let screenWidth = screenRect.size.width
    }
}
