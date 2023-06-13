//
//  PostViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        title = titlePost
        
        let barButtonItem = UIBarButtonItem(image: UIImage(named: "plus"), style: .plain, target: self, action: #selector(barButtonShow))
        navigationItem.setRightBarButton(barButtonItem, animated: true)
    }
    
    @objc func barButtonShow() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true)
    }
}
