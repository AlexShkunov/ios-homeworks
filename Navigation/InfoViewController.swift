//
//  InfoViewController.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.isUserInteractionEnabled = true
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button.setTitle("Continue?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(showButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(button)
    }
    
    @objc func showButton() {
        
        let alertViewController = UIAlertController(title: "Сontinue?", message: "Continue browsing", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {_ in
            print("Cancel")
        }
        alertViewController.addAction(okAction)
        alertViewController.addAction(cancelAction)
        present(alertViewController, animated: true)
        
    }
}
