//
//  ProfileViewControlle.swift
//  Navigation
//
//  Created by Alex Shkunov on 4/16/23.
//

import UIKit

class ProfileViewControlle: UIViewController {
    
    var profileHeaderView: ProfileHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = "Profile"
        
        
        profileHeaderView = ProfileHeaderView()
        profileHeaderView?.backgroundColor = .clear
        if let profileHeaderView = profileHeaderView {
            view.addSubview(profileHeaderView)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileHeaderView?.frame = CGRect(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: view.frame.width, height: view.frame.height)
    }
}
