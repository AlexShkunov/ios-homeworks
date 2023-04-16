//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Post")
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button.setTitle("Show feed", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "Feed"
        view.addSubview(button)
        
    }
    
    @objc func showDetails() {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
        
    }
}
