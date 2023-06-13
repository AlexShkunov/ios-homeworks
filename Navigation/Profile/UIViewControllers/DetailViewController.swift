//
//  DetailViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 6/12/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    func setupVC(post: PostForProfile) {
        authorOfPost.text = post.author
        postImageView.image = post.image
        postDescription.text = post.description
        likesLabel.text = "Likes: \(String(post.likes))"
        viewsLabel.text = "Views: \(String(post.views))"
    }
    
    private func layout() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            //scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            //contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        [authorOfPost, postImageView, postDescription, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            // authorOfPost
            authorOfPost.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metric.viewInset),
            authorOfPost.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Metric.viewInset),
            authorOfPost.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Metric.viewInset),
            
            // postImageView
            postImageView.topAnchor.constraint(equalTo: authorOfPost.bottomAnchor, constant: Metric.viewInset),
            postImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: Metric.screenWidth),
            
            // postDescription
            postDescription.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: Metric.viewInset),
            postDescription.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Metric.viewInset),
            postDescription.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Metric.viewInset),
            
            // likesLabel
            likesLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: Metric.viewInset),
            likesLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: Metric.viewInset),
            
            // viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -Metric.viewInset)
        ])
    }
}
extension DetailViewController {
    enum Metric {
        static let viewInset: CGFloat = 16
        static let screenRect = UIScreen.main.bounds
        static let screenWidth = screenRect.size.width
    }
}
