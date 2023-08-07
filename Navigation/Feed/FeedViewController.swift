//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .lastBaseline
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var button1: UIButton = {
        let button1 = UIButton()
        button1.isUserInteractionEnabled = true
        button1.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button1.setTitle("Show feed", for: .normal)
        button1.backgroundColor = .blue
        button1.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        return button1
    }()
    
    private lazy var button2: UIButton = {
        let button2 = UIButton()
        button2.isUserInteractionEnabled = true
        button2.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button2.setTitle("Show feed", for: .normal)
        button2.backgroundColor = .blue
        button2.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Feed"
        layoutStackView()
    }
    
    @objc func showDetails() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
    
    private func layoutStackView() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
}
